class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :learning_history
  validates :title, presence: true
end
