class AddTrialToBuycar < ActiveRecord::Migration[5.2]
  def change
    add_column :buycars, :trial, :integer
  end
end
