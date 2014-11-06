require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = User.new(
      firstname: 'Jake',
      lastname: 'Finn',
      email: 'adventure@adventuretime.com',
      password: 12345678,
      password_confirmation: 12345678
    )
  end

  it 'should be valid' do
    @user.save!
  end

  it 'should require an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'should require a unique email' do
    @user.save
    twin_user = User.new(email: 'adventure@adventuretime.com')
    expect(twin_user).to_not be_valid
  end
end