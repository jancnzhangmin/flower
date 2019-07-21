class ChangeLatFieldForCityCoordinates < ActiveRecord::Migration[5.2]
  def change
    change_column :citycoordinates, :lng, :decimal, precision:15, scale: 12
    change_column :citycoordinates, :lat, :decimal, precision:15, scale: 12
  end
end
