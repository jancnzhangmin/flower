class CreateStayincomes < ActiveRecord::Migration[5.2]
  def change
    create_table :stayincomes do |t|
      t.bigint :user_id
      t.string :ordernumber
      t.integer :incomestatus
      t.float :price

      t.timestamps
    end
  end
end
