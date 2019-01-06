class AddFrontuuidToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :frontuuid, :string
  end
end
