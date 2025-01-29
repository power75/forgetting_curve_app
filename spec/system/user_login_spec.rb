require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  include LoginMacros
  let(:user) { create(:user) }

  scenario "間違った情報でログイン" do
    visit login_path
    fill_in 'email', with: ""
    fill_in 'password', with: ""
    click_button 'ログイン'
    expect(page).to have_content 'ログインに失敗しました'
  end

  describe "ログイン前にヘッダー各リンクにアクセスする" do

    scenario "ログイン前にダッシュボードにアクセスする" do
      visit dashboard_path
      expect(page).to have_content 'ログインしてください'
      expect(current_path).to eq login_path
    end

    scenario "ログイン前に学習記録作成にアクセスする" do
      visit new_learning_history_path
      expect(page).to have_content 'ログインしてください'
      expect(current_path).to eq login_path
    end

    scenario "ログイン前に学習記録一覧にアクセスする" do
      visit learning_histories_path
      expect(page).to have_content 'ログインしてください'
      expect(current_path).to eq login_path
    end

    scenario "ログイン前にQuiz一覧にアクセスする" do
      visit quizzes_path
      expect(page).to have_content 'ログインしてください'
      expect(current_path).to eq login_path
    end

    scenario "ログイン前に通知一覧にアクセスする" do
      visit notifications_path
      expect(page).to have_content 'ログインしてください'
      expect(current_path).to eq login_path
    end

    scenario "ログイン前にプロフィールにアクセスする" do
      visit user_path(user)
      expect(page).to have_content 'ログインしてください'
      expect(current_path).to eq login_path
    end
  end
  describe "ログイン後にヘッダー各リンクにアクセスする" do

    scenario "ユーザー登録を行う" do
      visit new_user_path

      fill_in 'user[name]', with: 'Test'
      fill_in 'user[email]', with: '1234@example.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '登録'

      expect(page).to have_content 'ユーザー登録に成功しました'
    end
    before do
      login(user)
    end


    scenario "ログイン後にダッシュボードにアクセスする" do
      visit dashboard_path
      expect(current_path).to eq dashboard_path
    end

    scenario "ログイン後に学習記録作成にアクセスする" do
      visit new_learning_history_path
      expect(current_path).to eq new_learning_history_path
    end

    scenario "ログイン後に学習記録一覧にアクセスする" do
      visit learning_histories_path
      expect(current_path).to eq learning_histories_path
    end

    scenario "ログイン後にQuiz一覧にアクセスする" do
      visit quizzes_path
      expect(current_path).to eq quizzes_path
    end

    scenario "ログイン後に通知一覧にアクセスする" do
      visit notifications_path
      expect(current_path).to eq notifications_path
    end

    scenario "ログイン後にプロフィールにアクセスする" do
      visit user_path(user)
      expect(current_path).to eq user_path(user)
      expect(page).to have_content 'プロフィール'
      expect(page).to have_selector('strong', text: 'メールアドレス:')
      expect(page).to have_field('user_email', with: user.email)
      expect(page).to have_selector('strong', text: 'ユーザー名:')
      expect(page).to have_content user.name
      expect(page).to have_selector('strong', text: '通知方法:')
      expect(page).to have_select('user_preferred_notification_method', selected: user.preferred_notification_method)
      expect(page).to have_button '保存する'
      expect(page).to have_link '退会する', href: user_path(user)
    end

    scenario "ログアウトが正常にできる" do
      visit root_path
      click_link 'ログアウト'
      expect(page).to have_content 'ログアウトしました'
      expect(current_path).to eq login_path
    end
  end
end
