class NotificationsController < ApplicationController
  def new; end

  def index
    @notifications = current_user.notifications
  end
end
