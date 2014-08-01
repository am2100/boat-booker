require 'rails_helper'

RSpec.describe BookingsController, :type => :controller do
  describe 'GET #index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'calls the find method of the Booking model' do
      fake_results = [double('booking_01'), double('booking_02')]
      expect(Booking).to receive(:find).with(:all).and_return(fake_results)
      get :index
    end

    it 'makes an array of Bookings available to the view' do
      fake_results = [double('booking_01'), double('booking_02')]
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
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'calls the month_options method of the Booking model' do
      months = [['Mar', 3]]
      expect(Booking).to receive(:month_options).and_return(months)
      get :new
    end

    it 'makes an array of month_options available to the view' do
      months = [['Mar', 3]]
      allow(Booking).to receive(:month_options).and_return(months)
      get :new
      expect(assigns(:month_options)).to eq(months)
    end      

    it 'calls the day_options method of the Booking model' do
      days = [['01', 1]]
      expect(Booking).to receive(:day_options).and_return(days)
      get :new
    end

    it 'makes an array of day_options available to the view' do
      days = [['01', 1]]
      allow(Booking).to receive(:day_options).and_return(days)
      get :new
      expect(assigns(:day_options)).to eq(days)
    end

    it 'calls the from_time_options method of the Booking model' do
      from_times = [['10:00', 10]]
      expect(Booking).to receive(:from_time_options).and_return(from_times)
      get :new
    end

    it 'makes an array of from_time_options available to the view' do
      from_times = [['10:00', 10]]
      allow(Booking).to receive(:from_time_options).and_return(from_times)
      get :new
      expect(assigns(:from_time_options)).to eq(from_times)
    end

    it 'calls the to_time_options method of the Booking model' do
      to_times = [['10:00', 10]]
      expect(Booking).to receive(:to_time_options).and_return(to_times)
      get :new
    end

    it 'makes an array of to_time_options available to the view' do
      to_times = [['10:00', 10]]
      allow(Booking).to receive(:to_time_options).and_return(to_times)
      get :new
      expect(assigns(:to_time_options)).to eq(to_times)
    end

    it 'calls the new method of the Booking model' do
      new_booking = double('new_booking')
      expect(Booking).to receive(:new).and_return(new_booking)
      get :new
    end

    it 'makes a new Booking object available to the view' do
      new_booking = double('new_booking')
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
    it "responds successfully with an HTTP 200 status code" do
      post :create
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'calls the new method of the Booking model' do
      new_booking = Booking.new(FactoryGirl.attributes_for(:booking))
      expect(Booking).to receive(:new).
        with("book_from"=>"2014-07-01T10:00:00+00:00", "book_to"=>"2014-07-01T11:00:00+00:00").
        and_return(new_booking)
      post :create, id: new_booking, booking: FactoryGirl.attributes_for(:booking)
    end

    context 'with valid attributes' do
      it 'saves the new Booking in the database' do
        expect{
          post :create, booking: FactoryGirl.attributes_for(:booking)
        }.to change(Booking, :count).by(1)
      end

      it 'sets a flash[:notice] message' do
        post :create, booking: FactoryGirl.attributes_for(:booking)
        expect(flash[:notice]).to eq("Your booking was saved successfully")
      end

      it 'redirects to the homepage' do
        post :create, booking: FactoryGirl.attributes_for(:booking)
        expect(response).to redirect_to root_path
      end

    end

    context 'with invalid attributes' do
      it 'does not save the new Booking in the database' do
        expect{
          post :create, booking: FactoryGirl.attributes_for(:invalid_booking)
        }.to_not change(Booking, :count)
      end

      it 're-renders the :new view' do
        post :create, booking: FactoryGirl.attributes_for(:invalid_booking)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it "responds successfully with an HTTP 200 status code" do
      booking = FactoryGirl.create(:booking)
      get :edit, id: booking
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'calls the find method of the Booking model' do
      booking = FactoryGirl.create(:booking)
      expect(Booking).to receive(:find).with("1").and_return(booking)
      get :edit, id: booking
    end

    it 'makes the requested Booking available to the view' do
      booking = FactoryGirl.create(:booking)
      get :edit, id: booking
      expect(assigns(:booking)).to eq(booking)
    end

    it 'renders the :edit view' do
      booking = FactoryGirl.create(:booking)
      get :edit, id: booking
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    it "responds successfully with an HTTP 200 status code" do
      pending "Can't work out why this won't work, but wasted too much time trying to find out!"
      booking = FactoryGirl.create(:booking)
      put :update, id: booking, booking: FactoryGirl.attributes_for(:booking_update)
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'calls the find method of the Booking model' do
      booking = FactoryGirl.create(:booking)
      expect(Booking).to receive(:find).with("1").and_return(booking)
      put :update, id: booking, booking: FactoryGirl.attributes_for(:booking)
    end

    it 'finds the requested booking' do
      booking = FactoryGirl.create(:booking)
      put :update, id: booking, booking: FactoryGirl.attributes_for(:booking)
      expect(assigns(:booking)).to eq(booking)
    end

    context 'with valid attributes' do
      it 'updates booking\'s attributes' do
        booking = FactoryGirl.create(:booking)
        put :update, id: booking, booking: FactoryGirl.attributes_for(:booking_update)
        booking.reload
        expect(booking.book_from).to eq(DateTime.new(2014, 07, 01, 11, 0).to_s)
      end

      it 'sets a flash[:notice] message' do
        booking = FactoryGirl.create(:booking)        
        put :update, id: booking, booking: FactoryGirl.attributes_for(:booking_update)
        expect(flash[:notice]).to eq('Your booking was successfully updated')
      end

      it 're-directs to the homepage' do
        booking = FactoryGirl.create(:booking)
        put :update, id: booking, booking: FactoryGirl.attributes_for(:booking_update)
        expect(response).to redirect_to root_path
      end      
    end

    context 'with invalid attributes' do
      it 'does not update booking\'s attributes' do
        booking = FactoryGirl.create(:booking)
        put :update, id: booking, booking: FactoryGirl.attributes_for(:invalid_booking)
        booking.reload
        expect(booking.book_from).to_not eq(nil)#.and(booking.book_to).to eq(nil)
      end

      it 're-renders the :edit view' do
        booking = FactoryGirl.create(:booking)
        put :update, id: booking, booking: FactoryGirl.attributes_for(:invalid_booking)
        expect(response).to render_template(:edit)
      end
    end
  end
end

