class Season < ApplicationRecord
  validates :name, presence: true
  has_many :seasons_ingredients
  has_many :ingredients, through: :seasons_ingredients
end
