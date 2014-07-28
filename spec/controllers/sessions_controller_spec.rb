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
      user = double('Jim')
      expect(User).to receive(:find_by_name).with('Jim').and_return(user)
      post :create, {name: 'Jim', password: 'banana'}
    end

    context 'with valid credentials' do
      it 'sets the session[:user_id] variable'

      it 'sets a flash[:notice] message'

      it 'redirects to the homepage'
    end

    context 'with invalid credentials' do
      it 'sets a flash[:notice] message'

      it 're-renders the :new view'
    end
  end
end
