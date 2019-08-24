class RemoveAddmoneyactiveToAddmoneygiveproduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :addmoneygiveproducts, :addmoneyactive
  end
end
