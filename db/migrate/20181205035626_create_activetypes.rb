class CreateActivetypes < ActiveRecord::Migration[5.2]
  def change
    create_table :activetypes do |t|
      t.bigint :buycar_id
      t.string :active
      t.integer :showlable
      t.string :summary
      t.string :keywords

      t.timestamps
    end
  end
end
