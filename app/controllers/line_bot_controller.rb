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
    message = {
      type: 'text',
      text: message
    }
    @client.push_message(user.line_user_id, message)
  end
end
