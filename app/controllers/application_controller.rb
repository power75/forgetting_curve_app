# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :danger
  include LineBotHelper

  private

  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください'
  end

  def send_notification(user, message)
    if user.line_user_id.present?
      send_push_message(user, message)
    end
  end
end
