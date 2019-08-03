class AddCorderToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :corder, :integer
  end
end
