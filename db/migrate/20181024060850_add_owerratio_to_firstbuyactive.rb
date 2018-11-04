class AddOwerratioToFirstbuyactive < ActiveRecord::Migration[5.2]
  def change
    add_column :firstbuyactives, :owerratio, :float
  end
end
