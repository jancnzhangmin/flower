class AddDepositToAgentlevel < ActiveRecord::Migration[5.2]
  def change
    add_column :agentlevels, :deposit, :float
    add_column :agentlevels, :frontend, :integer
  end
end
