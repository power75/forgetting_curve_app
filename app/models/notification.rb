# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :quiz, optional: true

  def send_email
    # メール送信のロジックをここに記述
    NotificationMailer.quiz_notification(quiz).deliver_now
  end
end
