class BookingsController < ApplicationController
  def index
    flash.keep
#    @bookings = Booking.find(:all).sort! {|a,b| a.book_from.hour <=> b.book_from.hour}
    @bookings = Booking.find(:all).sort! {|a,b| a.book_from <=> b.book_from}
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
#    p params
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
