class AddAgentpaymentToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agentpayment, :float
    add_column :users, :deposit, :float
  end
end
