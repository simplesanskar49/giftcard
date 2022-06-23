class AddUserIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user_id, :integer
    add_index :orders, :user_id
  end
end
