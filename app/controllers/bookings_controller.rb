class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(:all)
  end

  def new

  end
end
