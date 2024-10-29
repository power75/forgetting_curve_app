class DashboardsController < ApplicationController

  def dashboard
    @notifications = current_user.notifications
    @data = current_user.learning_histories.group_by_day(:created_at).sum(:hour)
    @start_date = Date.today -1.month
    @end_date = Date.today -1.month
  end
end
