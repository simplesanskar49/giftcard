class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first
      t.string :last
      t.string :value
      t.string :number
      t.string :address

      t.timestamps
    end
  end
end
