class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_type
      t.string :title
      t.text :body
      t.string :url
      t.belongs_to :user
      t.timestamps
    end
  end
end
