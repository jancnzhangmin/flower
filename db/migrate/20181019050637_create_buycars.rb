class CreateBuycars < ActiveRecord::Migration[5.2]
  def change
    create_table :buycars do |t|
      t.bigint :product_id
      t.bigint :user_id
      t.float :number

      t.timestamps
    end
  end
end
