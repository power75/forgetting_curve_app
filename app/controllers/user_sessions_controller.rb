class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to(root_path, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:danger] = 'logouted'
    redirect_to root_path, status: :see_other
  end
end
