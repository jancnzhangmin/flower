class AddShowinproductToCla < ActiveRecord::Migration[5.2]
  def change
    add_column :clas, :showinproduct, :integer
  end
end
