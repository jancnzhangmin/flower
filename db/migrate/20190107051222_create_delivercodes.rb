class CreateDelivercodes < ActiveRecord::Migration[5.2]
  def change
    create_table :delivercodes do |t|
      t.string :name
      t.string :comcode

      t.timestamps
    end
  end
end
