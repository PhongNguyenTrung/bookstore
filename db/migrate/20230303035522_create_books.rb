class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.decimal :price
      t.date :year
      t.integer :amount
      t.text :descrition
      t.string :img_url
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
