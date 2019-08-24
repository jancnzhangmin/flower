class AddDiscountToLimitactivedetail < ActiveRecord::Migration[5.2]
  def change
    add_column :limitactivedetails, :discount, :float
  end
end
