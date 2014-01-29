class ReplaceBaseValueOnProduct < ActiveRecord::Migration
  def up
    remove_column :products, :base_value
    add_column :products, :base_value, :string,size:255
  end

  def down
  end
end
