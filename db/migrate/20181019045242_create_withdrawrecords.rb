class CreateWithdrawrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawrecords do |t|
      t.bigint :user_id
      t.float :amount
      t.integer :withdrawto
      t.string :bank
      t.string :account
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
