class AddIngredientDescription < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :description, :string
  end
end
