require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:invalid_user)).to_not be_valid
  end
end
