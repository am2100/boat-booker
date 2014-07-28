require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'calls the find_by_name method of the User model' do
      user = FactoryGirl.create(:user)
      expect(User).to receive(:find_by_name).with('Bob').and_return(user)
      post :create, FactoryGirl.attributes_for(:user)
    end

    context 'with valid credentials' do
      before :each do
        @user = FactoryGirl.create(:user)
        allow(User).to receive(:find_by_name).with('Bob').and_return(@user)
        post :create, FactoryGirl.attributes_for(:user)
      end

      it 'sets the session[:user_id] variable' do
        expect(session[:user_id]).to eq(@user.id)
      end

      it 'sets a flash[:notice] message' do
        expect(flash[:notice]).to eq('Logged in!')
      end

      it 'redirects to the homepage' do
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid credentials' do
      it 'sets a flash[:notice] message'

      it 're-renders the :new view'
    end
  end
end
