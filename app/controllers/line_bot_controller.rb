require 'line/bot'

class LineBotController < ApplicationController
  def initialize
    @client = Line::Bot::Client.new do |config|
      config.channel_id = ENV["LINE_CHANNEL_ID"]
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  def send_notification(user, message)
    line_auth = user.authentications.find_by(provider: 'line')
    if line_auth
      message = {
        type: 'text',
        text: message
      }
      response = @client.push_message(line_auth.uid, message)
      p response
    else
      Rails.logger.error "LINE authentication not found for user #{user.id}"
    end
  end
end
