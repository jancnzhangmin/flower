class AddStreetToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :street, :string
    add_column :orders, :adcode, :string
    add_column :orders, :status, :integer
  end
end
