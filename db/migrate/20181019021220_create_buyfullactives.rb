class CreateBuyfullactives < ActiveRecord::Migration[5.2]
  def change
    create_table :buyfullactives do |t|
      t.string :name
      t.datetime :begintime
      t.datetime :endtime
      t.integer :status

      t.timestamps
    end
  end
end
