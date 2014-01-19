class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :email
      t.decimal :amount
      t.integer :product_id

      t.timestamps
    end
  end
end
