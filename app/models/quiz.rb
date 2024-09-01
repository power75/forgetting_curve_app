class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :learning_history, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :sample_answer, presence: true
  validates :user_answer, presence: true, on: :update, if: -> { user_answer.blank? }

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "learning_history_id", "sample_answer", "title", "updated_at", "user_answer", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["learning_history", "user"]
  end
end
