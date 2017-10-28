class SeasonsIngredient < ApplicationRecord
  belongs_to :season
  belongs_to :ingredient
end
