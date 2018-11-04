class CreateFirstbuyactivedetails < ActiveRecord::Migration[5.2]
  def change
    create_table :firstbuyactivedetails do |t|
      t.bigint :product_id
      t.bigint :firstbuyactive_id
      t.float :number
      t.float :owerprofit

      t.timestamps
    end
  end
end
