class AddAttachmentSysqrToSysqrs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :sysqrs do |t|
      t.attachment :sysqr
    end
  end

  def self.down
    remove_attachment :sysqrs, :sysqr
  end
end
