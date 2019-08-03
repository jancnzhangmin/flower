class AddDisplaysaleToConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :displaysale, :integer
  end
end
