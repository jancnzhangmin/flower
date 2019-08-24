class AddNameToAddmoneyactive < ActiveRecord::Migration[5.2]
  def change
    add_column :addmoneyactives, :name, :string
  end
end
