module LoginMacros
  def login(user)
    visit login_path
    fill_in 'email', with: "test@example.com"
    fill_in 'password', with: "password"
    click_button 'ログイン'
  end
end
