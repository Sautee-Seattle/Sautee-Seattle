require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    before(:each) {get :show, params: {id: 4}}
    it "returns 200" do
      expect(response).to be_ok
    end
    it "TEMPORARY - assigns a user instance variable with 5 posts" do
      expect(assigns[:user].posts.length).to eq(5)
    end
  end
end
