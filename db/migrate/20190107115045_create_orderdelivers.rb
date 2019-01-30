class CreateOrderdelivers < ActiveRecord::Migration[5.2]
  def change
    create_table :orderdelivers do |t|
      t.bigint :order_id
      t.string :name
      t.string :comcode
      t.string :num

      t.timestamps
    end
  end
end
