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

  it 'returns an array of day options' do
    options = Booking.day_options
    expect(options).to eq([['01', 1],
                           ['02', 2],
                           ['03', 3],
                           ['04', 4],
                           ['05', 5],
                           ['06', 6],
                           ['07', 7],
                           ['08', 8],
                           ['09', 9],
                           ['10', 10],
                           ['11', 11],
                           ['12', 12],
                           ['13', 13],
                           ['14', 14],
                           ['15', 15],
                           ['16', 16],
                           ['17', 17],
                           ['18', 18],
                           ['19', 19],
                           ['20', 20],
                           ['21', 21],
                           ['22', 22],
                           ['23', 23],
                           ['24', 24],
                           ['25', 25],
                           ['26', 26],
                           ['27', 27],
                           ['28', 28],
                           ['29', 29],
                           ['30', 30],
                           ['31', 31]])
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

  it 'returns a pretty time string' do
    pretty_01 = Booking.pretty_time(1)
    pretty_10 = Booking.pretty_time(10)
    expect(pretty_01).to eq('01:00')
    expect(pretty_10).to eq('10:00')
  end
end
