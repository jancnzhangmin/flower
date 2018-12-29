class RemoveOptionalFromBuycaroptional < ActiveRecord::Migration[5.2]
  def change
    remove_column :buycaroptionals, :optional_id, :bigint
    remove_column :buycaroptionals, :condition_id, :bigint
  end
end
