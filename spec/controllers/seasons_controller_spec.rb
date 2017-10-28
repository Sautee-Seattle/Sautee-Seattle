require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  let!(:season) {Season.create(name: "Fall")}

  context "seasons#show" do
    it "renders Winter CSS if successful" do
      get :show, params: {id: 1}
      expect(response.status).to eq 200
    end
    it "renders Spring CSS if successful" do
      get :show, params: {id: 2}
      expect(response.status).to eq 200
    end
    it "renders Summer CSS if successful" do
      get :show, params: {id: 3}
      expect(response.status).to eq 200
    end
    it "renders Fall CSS if successful" do
      get :show, params: {id: 4}
      expect(response.status).to eq 200
    end
  end


end
