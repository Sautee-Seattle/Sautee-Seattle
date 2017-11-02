class AddAttachableImageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_attachment :posts, :image
  end
end
