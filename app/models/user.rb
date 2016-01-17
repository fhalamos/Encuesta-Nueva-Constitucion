class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_answers


  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def get_score
    query = 'SELECT SUM("Xaxis"), SUM("Yaxis") FROM "answers" INNER JOIN "user_answers" ON "answers"."id" = "user_answers"."answer_id" INNER JOIN "users" ON "user_answers"."user_id" = ' + self.id.to_s + ';'
    results = ActiveRecord::Base.connection.execute(query)
    {
      Xaxis: results.getvalue(0,0),
      Yaxis: results.getvalue(0,1)
    }
  end

end
