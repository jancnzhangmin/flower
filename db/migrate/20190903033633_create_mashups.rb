class CreateMashups < ActiveRecord::Migration[5.2]
  def change
    create_table :mashups do |t|
      t.string :name
      t.integer :showlable
      t.string :summary
      t.string :keywords
      t.integer :buynumber
      t.bigint :giveproduct_id
      t.integer :status
      t.datetime :begintime
      t.datetime :endtime

      t.timestamps
    end
  end
end
