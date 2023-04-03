class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.boolean :status
      t.integer :quantity
      t.decimal :total_price
      t.references :Order, null: false, foreign_key: true
      t.references :Book, null: false, foreign_key: true
      t.references :Shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
