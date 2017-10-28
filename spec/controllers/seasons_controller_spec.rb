require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  let!(:season) {Season.create(name: "Fall")}

  context "seasons#show" do
    it "renders Fall CSS if successful" do
      get :show, params: {name: "Fall"}
      expect(page.body).to include("seasons-show-Fall")
    end
  end


end
