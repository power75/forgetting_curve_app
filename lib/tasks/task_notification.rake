# frozen_string_literal: true

namespace :task_notification do
  desc 'quizのURLを送信する'
  task send: :environment do
    quizzes = Quiz.all
    quizzes.each do |quiz|
      if quiz.notification.nil? && quiz.learning_history.status == 'incomplete' # 初回通知
        notification = quiz.create_notification(user: quiz.user, title: quiz.title,
                                                notification_date: Time.zone.today)
        notification.save
        # 初回はまずnotificationのreviewed_atを作る
        notification.send_email if quiz.created_at <= 1.days.ago
      elsif quiz.learning_history.status == 'incomplete' && quiz.notification.notification_date <= 1.days.ago # 2回目以降の通知
        quiz.notification.update(notification_date: Time.zone.today)
        quiz.notification.send_email
      end
    end
  end
end
