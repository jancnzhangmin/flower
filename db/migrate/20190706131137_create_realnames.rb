class CreateRealnames < ActiveRecord::Migration[5.2]
  def change
    create_table :realnames do |t|
      t.bigint :user_id
      t.integer :examinestatus
      t.integer :adjust
      t.string :adjustsummary

      t.timestamps
    end
  end
end
