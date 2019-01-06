class CreateOrderoptionals < ActiveRecord::Migration[5.2]
  def change
    create_table :orderoptionals do |t|
      t.bigint :orderdetail_id
      t.bigint :selectcondition_id
      t.string :selectcondition_name

      t.timestamps
    end
  end
end
