class CreateMultibuyfullbuyproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :multibuyfullbuyproducts do |t|
      t.bigint :multibuyfull_id
      t.bigint :product_id

      t.timestamps
    end
  end
end
