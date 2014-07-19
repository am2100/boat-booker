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

  describe 'POST #create' do

    it 'calls the new method of the Booking model' do
      new_booking = Booking.new
      expect(Booking).to receive(:new).
        with(FactoryGirl.attributes_for(:booking)).
        and_return(new_booking)
      post :create, booking: FactoryGirl.attributes_for(:booking)
    end

    context 'with valid attributes' do
      it 'saves the new Booking in the database' do
        expect{
          post :create, booking: FactoryGirl.attributes_for(:booking)
        }.to change(Booking, :count).by(1)
      end

      it 'sets a flash[:notice] message' do
        post :create
        expect(flash[:notice]).to eq("Your booking was saved successfully")
      end

      it 'redirects to the :index view'

    end

    context 'with invalid attributes' do
      it 'does not save the new Booking in the database' do
        expect{
          post :create, booking: FactoryGirl.attributes_for(:invalid_booking)
        }.to_not change(Booking, :count)
      end

      it 're-renders the :new view' 

    end
  end
end

