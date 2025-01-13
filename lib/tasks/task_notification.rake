# frozen_string_literal: true

namespace :task_notification do
  desc 'quizのURLを送信する'
  task send: :environment do
    quizzes = Quiz.all
    today = Time.zone.today

    quizzes.each do |quiz|
      next if quiz.learning_history.status != 'incomplete'
      # 通知が存在しない場合は作成
      notification = quiz.notification || quiz.create_notification(user: quiz.user, title: quiz.title)

      # 通知日を設定
      notification_dates = [
        quiz.created_at.to_date + 1.day,
        quiz.created_at.to_date + 1.week,
        quiz.created_at.to_date + 1.month
      ]
      # 通知日が今日の場合は通知を送信
      if notification_dates.include?(today)
        notification.update(notification_date: today)
        send_notification(notification)
      end
    end
  end

  def send_notification(notification)
    user = notification.user
    message = "あなたのクイズのURLはこちらです: #{notification.quiz.url}"

    if user.preferred_notification_method == 'line'
      # LINE通知を送信するロジック
      LineBotController.new.send_notification(user, message)
    else
      # メール通知を送信するロジック
      notification.send_email
    end
  end
end
# rails task_notification:sendでタスクを実行
