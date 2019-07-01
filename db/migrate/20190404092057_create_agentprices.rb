class CreateAgentprices < ActiveRecord::Migration[5.2]
  def change
    create_table :agentprices do |t|
      t.bigint :agentlevel_id
      t.bigint :product_id
      t.float :price

      t.timestamps
    end
  end
end
