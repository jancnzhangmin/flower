class AddAddmoneyactiveidToAddmoneygiveproduct < ActiveRecord::Migration[5.2]
  def change
    add_column :addmoneygiveproducts, :addmoneyactive_id, :bigint
  end
end
