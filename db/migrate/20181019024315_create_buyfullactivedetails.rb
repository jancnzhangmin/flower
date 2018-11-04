class CreateBuyfullactivedetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buyfullactivedetails do |t|
      t.bigint :product_id
      t.bigint :buyfullactive_id
      t.float :number
      t.bigint :giveproduct_id
      t.float :givenumber

      t.timestamps
    end
  end
end
