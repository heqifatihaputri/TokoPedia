class RemoveUserIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :user_id, :integer
  end
end
