class BookingController < ApplicationController
  def index
    @bookings = Booking.find(:all)
  end
end
