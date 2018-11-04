class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.bigint :manufacturer_id
      t.string :name
      t.float :cost
      t.float :price
      t.text :content
      t.integer :grounding
      t.string :unit
      t.string :spec

      t.timestamps
    end
  end
end
