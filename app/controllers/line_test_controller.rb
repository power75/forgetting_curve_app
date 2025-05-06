class LineTestController < ApplicationController
  def test_push
    message = {
      type: 'text',
      text: 'テストメッセージです。LINE連携が正常に機能しています。'
    }

    if current_user.line_user_id.present?
      send_notification(current_user, message)
      redirect_to root_path, success: 'テストメッセージを送信しました'
    else
      redirect_to root_path, danger: 'LINEアカウントが連携されていません'
    end
  end
end
