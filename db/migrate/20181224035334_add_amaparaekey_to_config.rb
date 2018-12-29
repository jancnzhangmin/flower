class AddAmaparaekeyToConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :amapareakey, :string
  end
end
