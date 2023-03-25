class CreateCartDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_details do |t|
      t.boolean :status
      t.integer :quantity
      t.decimal :total_price
      t.references :cart, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
