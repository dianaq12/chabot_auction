class AddPaidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :paid, :boolean, default: false
  end
end
