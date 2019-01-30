class AddStatusToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :order_id, :bigint
    add_column :comments, :status, :integer
  end
end
