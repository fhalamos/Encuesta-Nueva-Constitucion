class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_answers
  has_many :answers, through: :user_answers

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end

    if auth.provider.eql? 'facebook'
      user.facebook_token = auth.credentials.token
      user.facebook_token_expiration = auth.credentials.expires_at
    end

    user.save
    user
  end

  def get_friends_scores
    graph = Koala::Facebook::API.new(facebook_token)
    friend_list = graph.get_connections('me', 'friends')
    ids = friend_list.map{|f| f['id']}
    User.where(uid: ids).map do |u|
      format_user_info(u)
    end

  end

  def get_user_info
    format_user_info(self)
  end

  def get_results
    get_friends_scores().push(get_user_info)
  end



  def get_score
    {
      Xaxis: answers.sum(:Xaxis),
      Yaxis: answers.sum(:Yaxis)
    }
  end

  private
  def format_user_info(user)
    {
      score: user.get_score,
      name: user.name,
      image: user.image
    }
  end

end
