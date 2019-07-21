class CreateMergepayorders < ActiveRecord::Migration[5.2]
  def change
    create_table :mergepayorders do |t|
      t.bigint :user_id
      t.string :ordernumber
      t.string :orderids
      t.integer :paystatus
      t.datetime :paytime

      t.timestamps
    end
  end
end
