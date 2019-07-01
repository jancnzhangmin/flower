class AddAgentuseridToBuycar < ActiveRecord::Migration[5.2]
  def change
    add_column :buycars, :agentuser_id, :bigint
  end
end
