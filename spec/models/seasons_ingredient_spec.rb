require 'rails_helper'

RSpec.describe SeasonsIngredient, type: :model do
  it { should belong_to(:season) }
  it { should belong_to(:ingredient) }
end
