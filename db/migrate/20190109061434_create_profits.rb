class CreateProfits < ActiveRecord::Migration[5.2]
  def change
    create_table :profits do |t|
      t.string :ordernumber
      t.float :amount
      t.string :summary
      t.integer :status

      t.timestamps
    end
  end
end
