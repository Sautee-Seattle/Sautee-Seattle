class AddImageToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :image, :string
  end
end
