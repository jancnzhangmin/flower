class CreateMultibuyfullgiveproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :multibuyfullgiveproducts do |t|
      t.bigint :multibuyfull_id
      t.bigint :product_id
      t.float :buyprice

      t.timestamps
    end
  end
end
