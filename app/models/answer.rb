class Answer < ActiveRecord::Base
  validates :content, presence: true
  validates :Xaxis, presence: true
  validates :Yaxis, presence: true
  belongs_to :question
end
