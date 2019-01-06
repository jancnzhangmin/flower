class CreateOrderactivetypes < ActiveRecord::Migration[5.2]
  def change
    create_table :orderactivetypes do |t|
      t.bigint :orderdetail_id
      t.string :active
      t.integer :showlable
      t.string :summary
      t.string :keywords

      t.timestamps
    end
  end
end
