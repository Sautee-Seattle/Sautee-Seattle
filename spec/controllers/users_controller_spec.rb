require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    it "returns 200" do
      get :show, params: {id: 4}
      expect(response).to be_ok
    end
  end
end
