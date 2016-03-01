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

  def get_quadrant
    score = get_score
    midX = Answer.sum(:Xaxis)/2
    midY = Answer.sum(:Yaxis)/2
    if score[:Xaxis] < midX
      if score[:Yaxis] < midY
        'Progresista'
      else
        'Reformista'
      end
    else
      if score[:Yaxis] < midY
        'Libertaria'
      else
        'Conservadora'
      end
    end
  end

  def get_friends_scores
    graph = Koala::Facebook::API.new(facebook_token)
    friend_list = graph.get_connections('me', 'friends')
    ids = friend_list.map{|f| f['id']}
    User.where(uid: ids).limit(10).map do |u|
      format_user_info(u, false)
    end

  end

  def get_user_info
    format_user_info(self, true)
  end

  def get_results
    get_friends_scores().push(get_user_info).push(*get_famous_results)
  end

  def get_famous_results
    User.where(famous: true).map do |u|
      format_user_info(u, false)
    end
  end


  def get_score
    {
      Xaxis: answers.sum(:Xaxis),
      Yaxis: answers.sum(:Yaxis)
    }
  end

  private
  def format_user_info(user, isSelf)
    {
      score: user.get_score,
      name: user.name,
      image: user.image,
      famous: user.famous,
      self: isSelf
    }
  end

end
