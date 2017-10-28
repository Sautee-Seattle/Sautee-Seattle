require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    let!(:jordan) { create(:user) }
    before(:each) { get :show, params: { id: jordan.id } }

    it "returns 200" do
      expect(response).to be_ok
    end

    it "assigns a user instance variable" do
      expect(assigns[:user].kind_of?(User)).to eq true
    end
  end

  describe "create" do
    before(:each) { post :create, params: { user: { username: 'blueberry', email: 'email', password: 'pw', bio: 'lalala' } }  }

    it "creates a user instance variable" do
      expect(assigns[:user]).to be_a User
    end

    context "user is valid" do
      it "creates a user in the database" do
        expect{ post :create, params: { user: FactoryBot.attributes_for(:user) } }.to change(User, :count).by 1
      end

      it "logs user in" do
        expect(session[:user_id]).to eq User.all.last.id
      end

      it "redirects to users show page" do
        expect(response).to redirect_to user_path(User.all.last.id)
      end
    end

    context "user is invalid" do
      it "creates an #errors" do
        post :create, params: { user: { username: 'blueberry', email: 'email', password: 'pw', bio: 'lalala' } }

        expect(assigns[:errors]).to include "Username has already been taken"
      end

      it "renders users#new view" do
        post :create, params: { user: { username: 'blueberry', email: 'email', password: 'pw', bio: 'lalala' } }

        expect(response).to render_template :new
      end
    end

    describe "#new" do
      it "creates a #user" do
        get :new
        expect(assigns[:user]).to be_a User
      end
    end
  end
end
