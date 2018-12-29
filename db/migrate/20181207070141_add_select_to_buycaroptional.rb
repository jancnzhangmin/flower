class AddSelectToBuycaroptional < ActiveRecord::Migration[5.2]
  def change
    add_column :buycaroptionals, :selectcondition_id, :bigint
    add_column :buycaroptionals, :selectcondition_name, :string
  end
end
