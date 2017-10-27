class CreateSeasonsIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons_ingredients do |t|
      t.references :ingredients, null: false
      t.references :seasons, null: false

      t.timestamps
    end
  end
end
