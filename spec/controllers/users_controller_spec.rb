require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    let!(:user) { create(:user) }
    before(:each) { get :show, params: { id: user.id } }

    it "returns 200" do
      expect(response).to be_ok
    end
    it "assigns a user instance variable" do
      expect(assigns[:user].kind_of?(User)).to eq true
    end
  end

  describe "create" do
    before(:each) { post :create, params: { user: { username: 'john', email: 'email', password: 'pw', bio: 'lalala' } }  }

    it "creates a user instance variable" do
      expect(assigns[:user]).to be_a User
    end

    context "user is valid" do

    end

    context "user is invalid" do

    end
  end
end
