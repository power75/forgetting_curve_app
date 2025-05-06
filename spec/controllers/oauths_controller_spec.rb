require 'rails_helper'

RSpec.describe OauthsController, type: :controller do
  let(:user) { create(:user) }
  let(:line_user_id) { 'U1234567890abcdef' }

  describe 'GET #oauth' do
    it 'セッションにaction_typeを保存すること' do
      get :oauth, params: { provider: :line, action_type: 'login' }
      expect(session[:action_type]).to eq 'login'
    end
  end

  describe 'GET #callback' do
    context 'action_typeがloginの場合' do
      context 'LINEアカウントが連携されている場合' do
        before do
          user.update(line_user_id: line_user_id)
          allow(controller).to receive(:login_from).and_return(user)
        end

        it 'ログインに成功し、成功メッセージを表示すること' do
          session[:action_type] = 'login'
          get :callback, params: { provider: :line }
          expect(response).to redirect_to(root_path)
          expect(flash[:success]).to eq('Lineでログインしました')
        end
      end

      context 'LINEアカウントが連携されていない場合' do
        before do
          allow(controller).to receive(:login_from).and_return(nil)
        end

        it 'ログインに失敗し、エラーメッセージを表示すること' do
          session[:action_type] = 'login'
          get :callback, params: { provider: :line }
          expect(response).to redirect_to(root_path)
          expect(flash[:danger]).to eq('Lineアカウントが登録されていません。先にLINEアカウントを連携してください。')
        end
      end
    end

    context 'action_typeがlinkingの場合' do
      before do
        login_user(user)
        allow(controller).to receive(:login_from).and_return(user)
        controller.instance_variable_set(:@user_hash, { user_info: { 'userId' => line_user_id } })
      end

      it 'LINEアカウントの連携に成功すること' do
        session[:action_type] = 'linking'
        get :callback, params: { provider: :line }
        expect(response).to redirect_to(root_path)
        expect(flash[:success]).to eq('Lineアカウントを連携しました')
        expect(user.reload.line_user_id).to eq(line_user_id)
      end

      it 'LINEアカウントの連携に失敗した場合、エラーメッセージを表示すること' do
        session[:action_type] = 'linking'
        allow_any_instance_of(User).to receive(:update).and_return(false)
        get :callback, params: { provider: :line }
        expect(response).to redirect_to(root_path)
        expect(flash[:danger]).to eq('Lineアカウントの連携に失敗しました。')
      end
    end

    context 'action_typeがregistrationの場合' do
      context '既存ユーザーの場合' do
        before do
          allow(controller).to receive(:login_from).and_return(user)
        end

        it 'ログインに成功すること' do
          session[:action_type] = 'registration'
          get :callback, params: { provider: :line }
          expect(response).to redirect_to(root_path)
          expect(flash[:success]).to eq('Lineでログインしました')
        end
      end

      context '新規ユーザーの場合' do
        let(:new_user) { build(:user) }

        before do
          allow(controller).to receive(:login_from).and_return(nil)
          allow(controller).to receive(:create_from).and_return(new_user)
          allow(controller).to receive(:auto_login)
        end

        it '新規登録に成功すること' do
          session[:action_type] = 'registration'
          get :callback, params: { provider: :line }
          expect(response).to redirect_to(root_path)
          expect(flash[:success]).to eq('Lineで登録しました')
        end
      end
    end

    context 'action_typeが不正な場合' do
      it 'エラーメッセージを表示すること' do
        session[:action_type] = 'invalid'
        get :callback, params: { provider: :line }
        expect(response).to redirect_to(root_path)
        expect(flash[:danger]).to eq('不正なリクエストです')
      end
    end
  end
end
