class ChangeBaseValueToString < ActiveRecord::Migration
  def up
    change_column :products, :base_value, :string, size:255
  end

  def down
    change_column :products, :base_value, :integer
  end
end
