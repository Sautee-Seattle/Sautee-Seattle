class CreateIngredientsPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients_posts do |t|
      t.belongs_to :ingredient
      t.belongs_to :post
      t.timestamps
    end
  end
end
