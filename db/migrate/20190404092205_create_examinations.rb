class CreateExaminations < ActiveRecord::Migration[5.2]
  def change
    create_table :examinations do |t|
      t.string :name
      t.datetime :begintime
      t.datetime :endtime

      t.timestamps
    end
  end
end
