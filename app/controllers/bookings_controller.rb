class BookingsController < ApplicationController
  def index
    flash.keep
    @bookings = Booking.find(:all)
  end

  def new
    @month_options = Booking.month_options
    @from_time_options = Booking.from_time_options
    @to_time_options = Booking.to_time_options
    @booking = Booking.new
  end

  def create
    year = DateTime.now.year
    month = params[:date][:month].to_i
    day = params[:date][:day].to_i
    from = params[:book][:from].to_i
    to = params[:book][:to].to_i

    book_from = DateTime.new(year, month, day, from)
    book_to   = DateTime.new(year, month, day, to)

    @booking = Booking.new(book_from: book_from, book_to: book_to)
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
