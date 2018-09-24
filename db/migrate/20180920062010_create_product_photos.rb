class CreateProductPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :product_photos do |t|
      t.integer :product_id
      t.string :photo

      t.timestamps
    end
  end
end
