require 'rails_helper'

RSpec.describe BookingController, :type => :controller do
  describe 'GET #index' do
    it 'calls the find method of the Booking model' do
      fake_results = [double('booking_01'), double('booking_02'), double('booking_03')]
      expect(Booking).to receive(:find).with(:all).and_return(fake_results)
      get :index
    end

    it 'makes an array of Bookings available to the view' do
      fake_results = [double('booking_01'), double('booking_02'), double('booking_03')]
      get :index
      expect(assigns(:bookings)).to match_array(fake_results)      
    end

    it 'renders the :index view'
  end
end

