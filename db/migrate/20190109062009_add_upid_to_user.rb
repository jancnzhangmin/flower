class AddUpidToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :up_id, :bigint
  end
end
