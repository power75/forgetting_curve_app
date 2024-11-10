class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  # ユーザーをプロバイダに送信し,そこで認証を行った後,コールバックURLに戻る.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      Rails.logger.debug @learning_history.errors.full_messages
      redirect_to root_path, :notice => "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, :notice => "#{provider.titleize}でログインしました"
      rescue
        redirect_to root_path, :alert => "#{provider.titleize}でログインに失敗しました"
      end
    end
  end

  private
  def auth_params
    params.permit(:code, :provider, :error, :state)
  end
end
