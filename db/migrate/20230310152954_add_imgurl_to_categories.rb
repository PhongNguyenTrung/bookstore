class AddImgurlToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :img_url, :string
  end
end
