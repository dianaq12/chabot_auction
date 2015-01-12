class AddLargePhotoUrl < ActiveRecord::Migration
  def up
    add_column :products, :large_photo_url, :string
  end

  def down
    remove_column :products, :large_photo_url
  end
end
