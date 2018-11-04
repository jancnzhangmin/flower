class CreateOrderdetails < ActiveRecord::Migration[5.2]
  def change
    create_table :orderdetails do |t|
      t.bigint :order_id
      t.bigint :product_id
      t.float :number
      t.float :price
      t.float :sum

      t.timestamps
    end
  end
end
