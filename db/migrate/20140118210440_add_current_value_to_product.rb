class AddCurrentValueToProduct < ActiveRecord::Migration
  def change
    add_column :products, :current_value, :decimal, :precision => 8, :scale => 2
  end
end
