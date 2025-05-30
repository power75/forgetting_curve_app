module AuthenticationHelper
  def login_user(user)
    session[:user_id] = user.id
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper, type: :controller
end
