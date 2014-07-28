class BookingsController < ApplicationController
  def index
    flash.keep
    @bookings = Booking.find(:all)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      flash[:notice] = "Your booking was saved successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update_attributes(params[:booking])
      flash[:notice] = "Your booking was successfully updated"
      redirect_to root_path
    else
      render :edit
    end
  end
end
