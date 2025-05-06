require 'rails_helper'

RSpec.describe LineTestController, type: :controller do
  let(:user) { create(:user) }
  let(:line_user_id) { 'U1234567890abcdef' }

  before do
    login_user(user)
  end

  describe 'GET #test_push' do
    context 'LINEアカウントが連携されている場合' do
      before do
        user.update(line_user_id: line_user_id)
      end

      it 'プッシュメッセージを送信し、成功メッセージを表示すること' do
        client = instance_double(Line::Bot::Client)
        response = instance_double(Net::HTTPResponse, code: '200', body: '{}')

        allow(LineBot).to receive(:client).and_return(client)
        allow(client).to receive(:push_message).and_return(response)

        get :test_push
        expect(response).to redirect_to(root_path)
        expect(flash[:success]).to eq('テストメッセージを送信しました')
      end
    end

    context 'LINEアカウントが連携されていない場合' do
      it 'エラーメッセージを表示すること' do
        get :test_push
        expect(response).to redirect_to(root_path)
        expect(flash[:danger]).to eq('LINEアカウントが連携されていません')
      end
    end
  end
end
