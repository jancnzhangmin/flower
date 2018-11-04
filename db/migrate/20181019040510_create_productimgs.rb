class CreateProductimgs < ActiveRecord::Migration[5.2]
  def change
    create_table :productimgs do |t|
      t.bigint :product_id
      t.integer :isdefault

      t.timestamps
    end
  end
end
