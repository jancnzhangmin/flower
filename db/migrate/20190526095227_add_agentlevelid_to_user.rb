class AddAgentlevelidToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agentlevel_id, :bigint
  end
end
