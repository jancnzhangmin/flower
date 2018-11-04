class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.string :appid
      t.string :appsecret
      t.float :autocomment
      t.float :minbankamount

      t.timestamps
    end
  end
end
