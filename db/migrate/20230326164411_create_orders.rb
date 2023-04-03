class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.boolean :status
      t.decimal :total_price
      t.text :shipping_address
      t.string :payment_method

      t.timestamps
    end
  end
end
