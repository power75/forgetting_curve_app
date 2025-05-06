module LineBotHelper
  def send_push_message(user, message)
    return unless user.line_user_id.present?

    client = LineBot.client
    response = client.push_message(user.line_user_id, message)

    if response.code == '200'
      Rails.logger.info "Push message sent successfully to user #{user.id}"
    else
      Rails.logger.error "Failed to send push message: #{response.body}"
    end
  end
end
