class CreateUserfirstbuystatus < ActiveRecord::Migration[5.2]
  def change
    create_table :userfirstbuystatus do |t|
      t.bigint :user_id
      t.bigint :firstbuyactive_id
      t.integer :status

      t.timestamps
    end
  end
end
