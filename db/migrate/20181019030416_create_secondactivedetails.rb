class CreateSecondactivedetails < ActiveRecord::Migration[5.2]
  def change
    create_table :secondactivedetails do |t|
      t.bigint :product_id
      t.bigint :secondactive_id
      t.float :firstprofit
      t.float :secondprofit

      t.timestamps
    end
  end
end
