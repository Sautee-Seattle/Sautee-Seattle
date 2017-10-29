require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:ingredient) {create(:ingredient)}
  describe "#location" do
    before(:each) { get :location, params: {ingredient_id: ingredient.id} }
    it "returns 200" do

    end
  end
end
