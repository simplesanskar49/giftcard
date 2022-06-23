class AddCommissionToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :commission, :float
  end
end
