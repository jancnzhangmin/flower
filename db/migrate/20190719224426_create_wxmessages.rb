class CreateWxmessages < ActiveRecord::Migration[5.2]
  def change
    create_table :wxmessages do |t|
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
