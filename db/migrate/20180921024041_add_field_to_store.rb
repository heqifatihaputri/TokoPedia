class AddFieldToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :address, :string
    add_column :stores, :country, :string
    add_column :stores, :city, :string
    add_column :stores, :street, :string
    add_column :stores, :latitude, :float
    add_column :stores, :longitude, :float
  end
end
