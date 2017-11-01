class AddAttachableImageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_attachment :users, :image
  end
end
