class AddAgentidToAgentcertificate < ActiveRecord::Migration[5.2]
  def change
    add_column :agentcertificates, :agent_id, :bigint
  end
end
