class AddQrjsonToProductqr < ActiveRecord::Migration[5.2]
  def change
    add_column :productqrs, :qrjson, :text
  end
end
