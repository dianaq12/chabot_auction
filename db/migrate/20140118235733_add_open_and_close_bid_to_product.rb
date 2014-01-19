class AddOpenAndCloseBidToProduct < ActiveRecord::Migration
  def change
    add_column :products, :open_on, :timestamp
    add_column :products, :close_on, :timestamp
  end
end
