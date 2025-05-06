require 'rails_helper'

RSpec.describe LineBotHelper, type: :helper do
  let(:user) { create(:user, line_user_id: 'U1234567890abcdef') }
  let(:message) { { type: 'text', text: 'テストメッセージ' } }

  describe '#send_push_message' do
    context 'LINEアカウントが連携されている場合' do
      it 'プッシュメッセージを送信すること' do
        client = instance_double(Line::Bot::Client)
        response = instance_double(Net::HTTPResponse, code: '200', body: '{}')

        allow(LineBot).to receive(:client).and_return(client)
        allow(client).to receive(:push_message).and_return(response)

        helper.send_push_message(user, message)
        expect(client).to have_received(:push_message).with(user.line_user_id, message)
      end
    end

    context 'LINEアカウントが連携されていない場合' do
      let(:user) { create(:user, line_user_id: nil) }

      it 'プッシュメッセージを送信しないこと' do
        client = instance_double(Line::Bot::Client)
        allow(LineBot).to receive(:client).and_return(client)
        allow(client).to receive(:push_message)

        helper.send_push_message(user, message)
        expect(client).not_to have_received(:push_message)
      end
    end
  end
end
