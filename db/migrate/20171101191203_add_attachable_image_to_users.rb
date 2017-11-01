class AddAttachableImageToUsers < ActiveRecord::Migration[5.1]
  def change
    def self.up
      add_attachment :users, :image
    end

    def self.down
      remove_attachment :users, :image
    end
  end
end
