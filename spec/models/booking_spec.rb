require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:booking)).to be_valid
  end

  it 'is invalid without a start time' do
    expect(FactoryGirl.build(:booking, from: nil)).to_not be_valid
  end

  it 'is invalid without an end time' do
    expect(FactoryGirl.build(:booking, to: nil)).to_not be_valid
  end
end
