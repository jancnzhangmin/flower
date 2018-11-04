class CreateFirstbuyactives < ActiveRecord::Migration[5.2]
  def change
    create_table :firstbuyactives do |t|
      t.string :name
      t.datetime :begintime
      t.datetime :endtime
      t.integer :long
      t.integer :status

      t.timestamps
    end
  end
end
