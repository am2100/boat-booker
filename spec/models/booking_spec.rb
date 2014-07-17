require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it 'is valid with a start and end time'
  it 'is invalid without a start time'
  it 'is invalid without an end time'
end
