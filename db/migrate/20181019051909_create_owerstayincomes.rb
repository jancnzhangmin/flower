class CreateOwerstayincomes < ActiveRecord::Migration[5.2]
  def change
    create_table :owerstayincomes do |t|
      t.bigint :user_id
      t.string :ordernumber
      t.integer :incomestatus
      t.float :price

      t.timestamps
    end
  end
end
