class CreateExaminationdetails < ActiveRecord::Migration[5.2]
  def change
    create_table :examinationdetails do |t|
      t.bigint :user_id
      t.bigint :examination_id
      t.float :amount
      t.string :productname
      t.float :productnumber

      t.timestamps
    end
  end
end
