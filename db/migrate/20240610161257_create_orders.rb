class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :total_price
      t.references :shipping_address, null: false, foreign_key: true
      t.string :shipping_phone
      t.date :estimated_delivery_date

      t.timestamps
    end
  end
end
