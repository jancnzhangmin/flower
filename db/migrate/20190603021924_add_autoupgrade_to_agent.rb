class AddAutoupgradeToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :autoupgrade, :integer
  end
end
