class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(:all)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end
end
