require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'sessions#new' do
    it 'returns a 200 status' do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe 'sessions#create' do

    context 'good login' do
      let!(:user){User.create!(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')}
      before(:each){ post :create, params: {:username => user.username, :password => 'pear'}, session: {user_id: user.id}}

      it 'redirects to root on succesful login' do
        expect(response).to redirect_to '/'
      end
    end

    context 'bad login' do
    end

  end
end
