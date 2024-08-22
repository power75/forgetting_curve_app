class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :learning_history, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :sample_answer, presence: true
  validates :user_answer, presence: true
end
