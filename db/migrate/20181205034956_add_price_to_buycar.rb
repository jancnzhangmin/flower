class AddPriceToBuycar < ActiveRecord::Migration[5.2]
  def change
    add_column :buycars, :price, :float
    add_column :buycars, :cost, :float
    add_column :buycars, :discount, :float
    add_column :buycars, :cover, :string
    add_column :buycars, :firstprofit, :float
    add_column :buycars, :secondprofit, :float
    add_column :buycars, :owerprofit, :float
    add_column :buycars, :producttype, :integer
  end
end
