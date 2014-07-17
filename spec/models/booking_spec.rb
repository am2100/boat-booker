require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it 'is valid with a start and end time' do
    from = Time.now
    to   = 1.hour.from_now
    booking = Booking.new(from: from, to: to)
    expect(booking).to be_valid
    
  end
  it 'is invalid without a start time' do
    expect(Booking.new(from: nil)).to have(1).errors_on(:from)
  end

  it 'is invalid without an end time'
end
