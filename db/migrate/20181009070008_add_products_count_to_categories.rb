class AddProductsCountToCategories < ActiveRecord::Migration[5.2]
  def self.up
    add_column :categories, :products_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :categories, :products_count
  end
end
