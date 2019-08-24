class CreateAddmoneygiveproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :addmoneygiveproducts do |t|
      t.bigint :product_id
      t.bigint :addmoneyactive

      t.timestamps
    end
  end
end
