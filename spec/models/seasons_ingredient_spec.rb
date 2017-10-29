require 'rails_helper'

RSpec.describe SeasonsIngredient, type: :model do
  describe "Seasons & Ingredients should have a relationship " do
    it { should belong_to(:season) }
    it { should belong_to(:ingredient) }
  end
end
