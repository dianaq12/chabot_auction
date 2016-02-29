class AddInvoicedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :invoiced, :boolean, default: false
  end
end
