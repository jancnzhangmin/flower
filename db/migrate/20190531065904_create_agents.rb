class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.bigint :user_id
      t.float :agentpayment
      t.string :phone
      t.integer :showphone

      t.timestamps
    end
  end
end
