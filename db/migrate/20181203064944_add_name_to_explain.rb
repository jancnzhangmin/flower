class AddNameToExplain < ActiveRecord::Migration[5.2]
  def change
    add_column :explains, :name, :string
  end
end
