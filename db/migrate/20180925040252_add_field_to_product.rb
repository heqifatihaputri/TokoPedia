class AddFieldToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category_id, :integer
    add_column :products, :sub_category_id, :integer
  end
end
