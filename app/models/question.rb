class Question < ActiveRecord::Base
	validates :content, presence: true
  has_many :answers, dependent: :destroy
end
