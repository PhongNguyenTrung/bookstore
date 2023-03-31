class RemoveShopReferenceFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :shop, null: false, foreign_key: true
  end
end
