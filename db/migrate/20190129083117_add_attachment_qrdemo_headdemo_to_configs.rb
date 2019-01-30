class AddAttachmentQrdemoHeaddemoToConfigs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :configs do |t|
      t.attachment :qrdemo
      t.attachment :headdemo
    end
  end

  def self.down
    remove_attachment :configs, :qrdemo
    remove_attachment :configs, :headdemo
  end
end
