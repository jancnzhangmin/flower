class AddProducttypeToOrderdetail < ActiveRecord::Migration[5.2]
  def change
    add_column :orderdetails, :producttype, :integer
  end
end
