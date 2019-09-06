class CreatePushorders < ActiveRecord::Migration[5.2]
  def change
    create_table :pushorders do |t|
      t.string :ordernumber
      t.text :content

      t.timestamps
    end
  end
end
