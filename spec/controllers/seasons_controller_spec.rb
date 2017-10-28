require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  let(:season_winter) {Season.create(name: "Winter")}
  let(:season_spring) {Season.create(name: "Spring")}
  let(:season_summer) {Season.create(name: "Summer")}
  let(:season_fall) {Season.create(name: "Fall")}

  context "seasons#index" do
    it "returns status of 200 if successful" do
      get :index
      expect(response.status).to eq 200
    end
    it "renders :index template if successful" do
      get :index
      expect(response).to render_template :index
    end
  end

  context "seasons#show" do
    it "returns Winter CSS if successful" do
      get :show, params: {id: season_winter.id}
      expect(response.status).to eq 200
    end
    it "renders :show template if successful" do
      get :show, params: {id: season_winter.id}
      expect(response).to render_template :show
    end
    it "returns Spring CSS if successful" do
      get :show, params: {id: season_spring.id}
      expect(response.status).to eq 200
    end
    it "renders :show template if successful" do
      get :show, params: {id: season_spring.id}
      expect(response).to render_template :show
    end
    it "returns Summer CSS if successful" do
      get :show, params: {id: season_summer.id}
      expect(response.status).to eq 200
    end
    it "renders :show template if successful" do
      get :show, params: {id: season_summer.id}
      expect(response).to render_template :show
    end
    it "returns Fall CSS if successful" do
      get :show, params: {id: season_fall.id}
      expect(response.status).to eq 200
    end
    it "renders :show template if successful" do
      get :show, params: {id: season_fall.id}
      expect(response).to render_template :show
    end
  end
end
