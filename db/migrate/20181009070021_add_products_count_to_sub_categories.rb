class AddProductsCountToSubCategories < ActiveRecord::Migration[5.2]
  def self.up
    add_column :sub_categories, :products_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :sub_categories, :products_count
  end
end
