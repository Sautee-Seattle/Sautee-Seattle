class Ingredient < ApplicationRecord
  has_many :seasons_ingredients
  has_many :seasons, through: :seasons_ingredients
  validates :name, presence: true
end
