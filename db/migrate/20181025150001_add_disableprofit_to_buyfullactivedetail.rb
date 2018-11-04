class AddDisableprofitToBuyfullactivedetail < ActiveRecord::Migration[5.2]
  def change
    add_column :buyfullactivedetails, :disableprofit, :integer
    add_column :buyfullactivedetails, :profitpercent, :float
    add_column :buyfullactivedetails, :disableowerprofit, :integer
    add_column :buyfullactivedetails, :owerprofitpercent, :float
    add_column :buyfullactivedetails, :intocost, :integer
  end
end
