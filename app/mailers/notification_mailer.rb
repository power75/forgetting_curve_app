# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def quiz_notification(quiz)
    @quiz = quiz
    @url = edit_quiz_url(@quiz)
    mail(to: @quiz.user.email, subject: '復習リマインダー')
  end
end
