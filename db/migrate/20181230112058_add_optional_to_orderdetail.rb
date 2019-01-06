class AddOptionalToOrderdetail < ActiveRecord::Migration[5.2]
  def change
    add_column :orderdetails, :optional, :string
  end
end
