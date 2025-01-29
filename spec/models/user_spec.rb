require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:user, email: user.email)
    expect(user).to_not be_valid
  end

  it 'is not valid with a password less than 3 characters' do
    user.password = '12'
    expect(user).to_not be_valid
  end

  it 'is not valid without password confirmation' do
    user.password_confirmation = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a non-unique reset password token' do
    create(:user, reset_password_token: 'token123')
    user.reset_password_token = 'token123'
    expect(user).to_not be_valid
  end

  it 'is valid with a nil reset password token' do
    user.reset_password_token = nil
    expect(user).to be_valid
  end

  it 'is valid with a valid preferred notification method' do
    user.preferred_notification_method = 'email'
    expect(user).to be_valid
  end
end
