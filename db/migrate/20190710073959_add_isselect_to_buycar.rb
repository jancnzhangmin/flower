class AddIsselectToBuycar < ActiveRecord::Migration[5.2]
  def change
    add_column :buycars, :isselect, :integer
  end
end
