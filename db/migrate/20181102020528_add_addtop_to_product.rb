class AddAddtopToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :addtop, :integer
  end
end
