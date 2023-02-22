class AddAttributesToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :name, :string
    add_column :shops, :address, :string
    add_column :shops, :phone, :string
    add_column :shops, :description, :text
    add_column :shops, :tax_code, :decimal
  end
end
