class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  # ユーザーをプロバイダに送信し,そこで認証を行った後,コールバックURLに戻る.
  def oauth
    session[:action_type] = params[:action_type] # セッションにaction_typeを保存
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    action_type = session.delete(:action_type) # セッションからaction_typeを取得

    if action_type == 'login'
      login_from(provider)
      redirect_to root_path, :success => "#{provider.titleize}でログインしました"
    elsif action_type == 'linking'
      handle_line_linking(provider)
    elsif action_type == 'registration'
      handle_line_registration(provider)
    else
      redirect_to root_path, danger: '不正なリクエストです'
    end
  end

  private
  def auth_params
    params.permit(:code, :provider, :error, :state, :action_type)
  end

  def handle_line_linking(provider)
    @user = login_from(provider)

    # LINEアカウントを現在のユーザーに紐付け
    # user_hashにuserId等の情報があるので、それをline_user_idとする
    if current_user.update(line_user_id: @user_hash[:user_info]['userId'])
      redirect_to root_path, success: "#{provider.titleize}アカウントを連携しました"
    else
      redirect_to root_path, danger: "#{provider.titleize}アカウントの連携に失敗しました。"
    end
  end

  def handle_line_registration(provider)
    if @user = login_from(provider)
      redirect_to root_path, success: "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider) do |user|
          user.email = "#{user.name.downcase.gsub(' ', '_')}@example.com" if user.email.blank?
        end
        reset_session
        auto_login(@user)
        redirect_to root_path, success: "#{provider.titleize}で登録しました"
      rescue => e
        Rails.logger.error "Registration Error: #{e.message}"
        redirect_to root_path, danger: "#{provider.titleize}での登録に失敗しました"
      end
    end
  end
end
