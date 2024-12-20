# frozen_string_literal: true

class NotificationsController < ApplicationController
  def new; end

  def index
    @notifications = current_user.notifications
  end
end
