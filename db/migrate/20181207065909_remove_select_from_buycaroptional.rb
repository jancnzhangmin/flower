class RemoveSelectFromBuycaroptional < ActiveRecord::Migration[5.2]
  def change
    remove_column :buycaroptionals, :select_optional, :bigint
    remove_column :buycaroptionals, :select_condition, :bigint
  end
end
