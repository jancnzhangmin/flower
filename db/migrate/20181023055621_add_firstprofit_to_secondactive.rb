class AddFirstprofitToSecondactive < ActiveRecord::Migration[5.2]
  def change
    add_column :secondactives, :firstprofit, :float
    add_column :secondactives, :secondprofit, :float
  end
end
