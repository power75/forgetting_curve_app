class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def notification(user)
    @user = user
    mail(to: @user.email,
    subject: '学習記録を作成しました')
  end
end
