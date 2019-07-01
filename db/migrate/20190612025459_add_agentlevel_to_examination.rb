class AddAgentlevelToExamination < ActiveRecord::Migration[5.2]
  def change
    add_column :examinations, :agentlevel, :string
  end
end
