class AddDeliverkeyToConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :deliverkey, :string
    add_column :configs, :delivercustomer, :string
  end
end
