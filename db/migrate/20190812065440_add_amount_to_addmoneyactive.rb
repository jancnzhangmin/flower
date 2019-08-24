class AddAmountToAddmoneyactive < ActiveRecord::Migration[5.2]
  def change
    add_column :addmoneyactives, :amount, :float
  end
end
