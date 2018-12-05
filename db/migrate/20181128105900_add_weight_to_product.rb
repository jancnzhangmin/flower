class AddWeightToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :weight, :string
    add_column :products, :brand, :string
    add_column :products, :pack, :string
    add_column :products, :season, :string
  end
end
