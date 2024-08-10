class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :learning_history
  validates :title, presence: true
  validates :content, presence: true
  validates :sample_answer, presence: true
end
