class ChangeLngForCitycoordinates < ActiveRecord::Migration[5.2]
  def change
    change_column :citycoordinates, :lng, :float
    change_column :citycoordinates, :lat, :float
  end
end
