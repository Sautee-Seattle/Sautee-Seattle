require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    before(:each) {get :show, params: {id: 4}}
    it "returns 200" do
      expect(response).to be_ok
    end
    it "assigns a user instance variable" do
      expect(assigns[:user].kind_of?(User)).to eq true
    end
  end
end
