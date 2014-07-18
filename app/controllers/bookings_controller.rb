class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(:all)
  end

  def new
    @booking = Booking.new
  end
end
