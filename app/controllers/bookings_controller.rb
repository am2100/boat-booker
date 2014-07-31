class BookingsController < ApplicationController
  def index
    flash.keep
    @bookings = Booking.find(:all)
  end

  def new
    @booking = Booking.new
  end

  def create
#raise params
    year = DateTime.now.year
p year
    month = params[:date][:month].to_i
p month
    day = params[:date][:day].to_i
p day
    from = params[:book][:from].to_i
p from
    to = params[:book][:to].to_i
p to

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
