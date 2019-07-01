class AddAgentpriceToBuycar < ActiveRecord::Migration[5.2]
  def change
    add_column :buycars, :agentprice, :float
  end
end
