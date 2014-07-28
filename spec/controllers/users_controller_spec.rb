require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'POST #create' do
    it 'calls the find_by_name method of the User model'

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
