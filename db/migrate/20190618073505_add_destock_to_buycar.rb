class AddDestockToBuycar < ActiveRecord::Migration[5.2]
  def change
    add_column :buycars, :destock, :integer
  end
end
