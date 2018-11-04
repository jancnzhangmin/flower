class CreateOptionals < ActiveRecord::Migration[5.2]
  def change
    create_table :optionals do |t|
      t.bigint :product_id
      t.bigint :product_id
      t.string :name

      t.timestamps
    end
  end
end
