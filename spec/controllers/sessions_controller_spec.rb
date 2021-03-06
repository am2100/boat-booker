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
      it 'sets a flash[:notice] message' do 
        @user = FactoryGirl.build(:invalid_user)
        allow(User).to receive(:find_by_name)
        post :create, FactoryGirl.attributes_for(:invalid_user)
        expect(flash[:notice]).to eq('Name or password is invalid')
      end

      it 're-renders the :new view' do
        post :create, FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'unsets the session[:user_id] variable' do
      delete :destroy
      expect(session[:user_id]).to eq(nil)
    end

    it 'sets a flash[:notice] message' do
      delete :destroy
      expect(flash[:notice]).to eq('Logged out!')
    end

    it 'redirects to the homepage' do
      delete :destroy
      expect(response).to redirect_to root_path
    end
  end
end
