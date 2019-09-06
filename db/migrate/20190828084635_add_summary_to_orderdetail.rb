class AddSummaryToOrderdetail < ActiveRecord::Migration[5.2]
  def change
    add_column :orderdetails, :summary, :string
  end
end
