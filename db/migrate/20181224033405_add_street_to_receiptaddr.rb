class AddStreetToReceiptaddr < ActiveRecord::Migration[5.2]
  def change
    add_column :receiptaddrs, :street, :string
  end
end
