require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  let!(:season) {Season.create(name: "Fall")}

  context "seasons#show" do
    it "renders Fall CSS if successful" do
      get :show
      expect(response).to include("seasons-show")
    end
  end


end
