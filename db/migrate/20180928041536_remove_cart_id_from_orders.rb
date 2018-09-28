class RemoveCartIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :cart_id, :integer
  end
end
