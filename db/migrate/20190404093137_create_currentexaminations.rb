class CreateCurrentexaminations < ActiveRecord::Migration[5.2]
  def change
    create_table :currentexaminations do |t|
      t.bigint :user_id
      t.bigint :examination_id
      t.integer :currentexamination

      t.timestamps
    end
  end
end
