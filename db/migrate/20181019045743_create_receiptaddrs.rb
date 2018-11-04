class CreateReceiptaddrs < ActiveRecord::Migration[5.2]
  def change
    create_table :receiptaddrs do |t|
      t.bigint :user_id
      t.string :contact
      t.string :contactphone
      t.string :contactphone
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.integer :isdefault

      t.timestamps
    end
  end
end
