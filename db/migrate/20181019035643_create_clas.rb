class CreateClas < ActiveRecord::Migration[5.2]
  def change
    create_table :clas do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
