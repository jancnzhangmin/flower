class CreateBankdefs < ActiveRecord::Migration[5.2]
  def change
    create_table :bankdefs do |t|
      t.string :code
      t.string :bank

      t.timestamps
    end
  end
end
