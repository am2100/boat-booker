require 'rails_helper'

RSpec.describe BookingsController, :type => :controller do
  describe 'GET #index' do
    it 'calls the find method of the Booking model' do
      fake_results = [double('booking_01'), double('booking_02'), double('booking_03')]
      expect(Booking).to receive(:find).with(:all).and_return(fake_results)
      get :index
    end

    it 'makes an array of Bookings available to the view' do
      fake_results = [double('booking_01'), double('booking_02'), double('booking_03')]
      allow(Booking).to receive(:find).and_return(fake_results)
      get :index
      expect(assigns(:bookings)).to match_array(fake_results)
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'calls the new method of the Booking model' do
      new_booking = Booking.new
      expect(Booking).to receive(:new).and_return(new_booking)
      get :new
    end

    it 'makes a new Booking object available to the view' do
      new_booking = Booking.new
      allow(Booking).to receive(:new).and_return(new_booking)
      get :new
      expect(assigns(:booking)).to eq(new_booking)
    end

    it 'renders the :new view' do
      get :new
      expect(response).to render_template :new
    end      
  end
end

