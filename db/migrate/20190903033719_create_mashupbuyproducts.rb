class CreateMashupbuyproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :mashupbuyproducts do |t|
      t.bigint :product_id
      t.bigint :mashup_id

      t.timestamps
    end
  end
end
