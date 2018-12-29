class AddAdcodeToReceiptaddr < ActiveRecord::Migration[5.2]
  def change
    add_column :receiptaddrs, :adcode, :string
  end
end
