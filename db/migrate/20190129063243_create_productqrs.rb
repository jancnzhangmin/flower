class CreateProductqrs < ActiveRecord::Migration[5.2]
  def change
    create_table :productqrs do |t|
      t.bigint :product_id

      t.timestamps
    end
  end
end
