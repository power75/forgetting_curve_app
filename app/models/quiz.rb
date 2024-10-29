# frozen_string_literal: true

class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :learning_history, dependent: :destroy
  has_one :notification, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :sample_answer, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[content created_at id learning_history_id sample_answer title updated_at user_answer
       user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[learning_history user]
  end

  def create_notification(attributes = {})
    build_notification(attributes)
  end
end
