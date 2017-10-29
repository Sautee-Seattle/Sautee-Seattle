require 'rails_helper'

describe SessionsController, type: :controller do
  let!(:user) { create(:user) }

  describe 'sessions#new' do
    it 'returns a 200 status' do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe 'sessions#create' do
    context 'good login' do
      before(:each){ post :create, params: {:username => user.username, :password => user.password}, session: {user_id: user.id}}

      it 'redirects to root on succesful login' do
        expect(response).to redirect_to '/'
      end
    end

    context 'bad login' do
      before(:each){ post :create, params: {:username => user.username, :password => user.password + "wenis"}, session: {user_id: user.id}}

      it 'redirects to login on a failed login' do
        expect(response).to redirect_to '/login'
      end
    end

    describe "sessions#destroy" do
      it 'destroys the session' do
        delete :destroy, session: {user_id: user.id}
        expect(session[:user_id]).to be_nil
      end
    end
  end
end
