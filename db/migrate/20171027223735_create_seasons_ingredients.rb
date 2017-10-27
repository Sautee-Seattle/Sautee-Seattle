class CreateSeasonsIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons_ingredients do |t|
      t.references :ingredient, null: false
      t.references :season, null: false

      t.timestamps
    end
  end
end
