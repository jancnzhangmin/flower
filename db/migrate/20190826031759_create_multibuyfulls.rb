class CreateMultibuyfulls < ActiveRecord::Migration[5.2]
  def change
    create_table :multibuyfulls do |t|
      t.string :name
      t.datetime :begintime
      t.datetime :endtime
      t.integer :status
      t.integer :showlable
      t.string :summary

      t.timestamps
    end
  end
end
