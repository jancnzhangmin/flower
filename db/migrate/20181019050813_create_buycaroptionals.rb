class CreateBuycaroptionals < ActiveRecord::Migration[5.2]
  def change
    create_table :buycaroptionals do |t|
      t.bigint :optional_id
      t.bigint :condition_id
      t.bigint :buycar_id

      t.timestamps
    end
  end
end
