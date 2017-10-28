class IngredientsPost < ApplicationRecord
  belongs_to :ingredient
  belongs_to :post
end
