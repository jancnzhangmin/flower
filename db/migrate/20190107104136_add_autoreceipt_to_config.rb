class AddAutoreceiptToConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :autoreceipt, :float
  end
end
