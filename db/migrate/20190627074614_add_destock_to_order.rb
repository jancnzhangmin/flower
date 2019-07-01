class AddDestockToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :destock, :integer
    add_column :orders, :agentuser_id, :bigint
  end
end
