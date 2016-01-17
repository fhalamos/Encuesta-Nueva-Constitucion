class UserAnswer < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  belongs_to :question
  belongs_to :answer



end
