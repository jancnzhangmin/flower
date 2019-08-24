class AddReceiveneworderToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :receiveneworder, :integer
  end
end
