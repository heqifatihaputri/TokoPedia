class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :cart, foreign_key: true
      t.decimal :total_price
      t.date :payment_time

      t.timestamps
    end
  end
end
