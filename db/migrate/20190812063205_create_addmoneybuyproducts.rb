class CreateAddmoneybuyproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :addmoneybuyproducts do |t|
      t.bigint :product_id
      t.bigint :addmoneyactive_id

      t.timestamps
    end
  end
end
