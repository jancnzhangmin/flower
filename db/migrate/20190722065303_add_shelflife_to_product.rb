class AddShelflifeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shelflife, :string
  end
end
