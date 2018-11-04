class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.string :ordernumber
      t.float :deduction
      t.float :payprice
      t.float :paysum
      t.integer :paystatus
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.string :contact
      t.string :contactphone
      t.integer :receiptstatus
      t.datetime :autoreceipttime
      t.string :summary

      t.timestamps
    end
  end
end
