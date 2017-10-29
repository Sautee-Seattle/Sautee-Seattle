require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:ingredient) {create(:ingredient)}
  describe "#location" do
    before(:each) { get :location, params: { ingredient_id: ingredient.id} }
    it "renders a location page" do
      expect(response).to render_template(:new_location)
    end
    it "assings an ingredient instance variable" do
      expect(assigns[:ingredient]).to eq(ingredient)
    end
  end
end
