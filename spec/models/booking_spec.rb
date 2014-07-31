require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:booking)).to be_valid
  end

  it 'is invalid without a start time' do
    expect(FactoryGirl.build(:invalid_from_booking)).to_not be_valid
  end

  it 'is invalid without an end time' do
    expect(FactoryGirl.build(:invalid_to_booking)).to_not be_valid
  end

  it 'returns an array of month options' do
    opts = Booking.month_options
    expect(opts).to eq([['Mar', 3],
                        ['Apr', 4],
                        ['May', 5],
                        ['Jun', 6],
                        ['Jul', 7],
                        ['Aug', 8],
                        ['Sep', 9],
                        ['Oct', 10]])
  end

  it 'returns an array of booking start time options'

  it 'returns an array of booking end time options'
end
