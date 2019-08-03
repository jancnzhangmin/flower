class AddWxpaysumToMergepayorder < ActiveRecord::Migration[5.2]
  def change
    add_column :mergepayorders, :wxpaysum, :float
  end
end
