class AddDeliverstatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :deliverstatus, :integer
  end
end
