class AddSelectoptionalToBuycaroptional < ActiveRecord::Migration[5.2]
  def change
    add_column :buycaroptionals, :select_optional, :bigint
    add_column :buycaroptionals, :select_condition, :bigint
  end
end
