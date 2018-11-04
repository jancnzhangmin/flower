class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.bigint :bankdef_id
      t.bigint :user_id
      t.string :account
      t.string :name

      t.timestamps
    end
  end
end
