class CreateCitycoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :citycoordinates do |t|
      t.string :province
      t.string :city
      t.decimal :lng
      t.decimal :lat

      t.timestamps
    end
  end
end
