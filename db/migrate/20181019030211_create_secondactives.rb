class CreateSecondactives < ActiveRecord::Migration[5.2]
  def change
    create_table :secondactives do |t|
      t.string :name
      t.datetime :begintime
      t.datetime :endtime
      t.integer :long
      t.integer :status
      t.string :summary

      t.timestamps
    end
  end
end
