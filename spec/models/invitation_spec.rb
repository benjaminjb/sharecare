require 'rails_helper'

RSpec.describe Invitation, :type => :model do
  before do
    @invite = Invitation.new(
      email: 'adventure@adventuretime.com'
    )
  end

  it 'should be valid' do
    @invite.save!
  end

  it 'should require an email' do
    @invite.email = nil
    expect(@invite).to_not be_valid
  end

  it 'should require a valid email' do
    @invite.email = "hello"
    expect(@invite).to_not be_valid
  end

end