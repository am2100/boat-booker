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
    options = Booking.month_options
    expect(options).to eq([['Mar', 3],
                        ['Apr', 4],
                        ['May', 5],
                        ['Jun', 6],
                        ['Jul', 7],
                        ['Aug', 8],
                        ['Sep', 9],
                        ['Oct', 10]])
  end

  it 'returns an array of booking start time options' do
    options = Booking.from_time_options
    expect(options).to eq([['08:00', 8],
                           ['09:00', 9],
                           ['10:00', 10],
                           ['11:00', 11],
                           ['12:00', 12],
                           ['13:00', 13],
                           ['14:00', 14],
                           ['15:00', 15],
                           ['16:00', 16],
                           ['17:00', 17],
                           ['18:00', 18],
                           ['19:00', 19],
                           ['20:00', 20],
                           ['21:00', 21]])
  end

  it 'returns an array of booking end time options' do
    options = Booking.to_time_options
    expect(options).to eq([['09:00', 9],
                           ['10:00', 10],
                           ['11:00', 11],
                           ['12:00', 12],
                           ['13:00', 13],
                           ['14:00', 14],
                           ['15:00', 15],
                           ['16:00', 16],
                           ['17:00', 17],
                           ['18:00', 18],
                           ['19:00', 19],
                           ['20:00', 20],
                           ['21:00', 21],
                           ['22:00', 22]])
  end

end
