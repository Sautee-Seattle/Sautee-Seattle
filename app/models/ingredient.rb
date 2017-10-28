class Ingredient < ApplicationRecord
  validates :name, presence: true
  has_many :seasons_ingredients
  has_many :seasons, through: :seasons_ingredients
end
