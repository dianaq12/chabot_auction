class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.string :photo_url
      t.text :description
      t.string :donor_name
      t.text :short_description
      t.decimal :base_value, :precision => 8, :scale => 2
      t.integer :min_bid
      t.integer :bid_increment
      t.integer :contact_id

      t.timestamps
    end
  end
end
