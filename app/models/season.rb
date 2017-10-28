class Season < ApplicationRecord
  has_many :seasons_ingredients
  has_many :ingredients, through: :seasons_ingredients
  validates :name, presence: true
end
