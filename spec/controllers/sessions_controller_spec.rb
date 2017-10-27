require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'sessions#new' do
    it 'returns a 200 status' do
      get :new
      expect(response.status).to eq 200
    end
  end
end
