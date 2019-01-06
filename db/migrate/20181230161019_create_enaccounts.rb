class CreateEnaccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :enaccounts do |t|
      t.bigint :user_id
      t.bigint :order_id
      t.float :amount
      t.string :summary
      t.integer :status

      t.timestamps
    end
  end
end
