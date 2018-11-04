class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :contact
      t.string :contactphone
      t.string :address
      t.string :summary

      t.timestamps
    end
  end
end
