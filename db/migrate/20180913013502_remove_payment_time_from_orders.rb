class RemovePaymentTimeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :payment_time, :date
  end
end
