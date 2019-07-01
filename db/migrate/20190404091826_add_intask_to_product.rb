class AddIntaskToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :intask, :integer
  end
end
