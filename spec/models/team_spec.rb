require 'rails_helper'

RSpec.describe Team, :type => :model do
  before do
    @team = Team.new(
      name: 'Pup'
    )
  end

  it 'should be valid' do
    @team.save!
  end

  it 'should require a name' do
    @team.name = nil
    expect(@team).to_not be_valid
  end

end