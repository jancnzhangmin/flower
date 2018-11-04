class CreateLimitactivedetails < ActiveRecord::Migration[5.2]
  def change
    create_table :limitactivedetails do |t|
      t.bigint :product_id
      t.bigint :limitactive_id
      t.float :price
      t.float :minnumber
      t.float :limitnumber
      t.integer :disableprofit
      t.float :profitpercent
      t.integer :disableowerprofit
      t.float :owerprofitpencent

      t.timestamps
    end
  end
end
