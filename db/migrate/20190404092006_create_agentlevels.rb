class CreateAgentlevels < ActiveRecord::Migration[5.2]
  def change
    create_table :agentlevels do |t|
      t.string :name
      t.integer :corder
      t.integer :grant
      t.float :amount
      t.float :task

      t.timestamps
    end
  end
end
