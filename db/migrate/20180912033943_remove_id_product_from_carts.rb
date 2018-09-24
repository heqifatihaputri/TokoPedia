class RemoveIdProductFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :product_id, :integer
  end
end
