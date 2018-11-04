class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :openid
      t.string :nickname
      t.string :headurl
      t.integer :vipid
      t.float :income
      t.float :withdraw
      t.integer :ordermsg

      t.timestamps
    end
  end
end
