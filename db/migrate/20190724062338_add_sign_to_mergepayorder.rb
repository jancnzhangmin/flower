class AddSignToMergepayorder < ActiveRecord::Migration[5.2]
  def change
    add_column :mergepayorders, :sign, :string
  end
end
