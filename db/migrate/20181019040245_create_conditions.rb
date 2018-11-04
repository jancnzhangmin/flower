class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.bigint :optional_id
      t.string :name
      t.float :weighting

      t.timestamps
    end
  end
end
