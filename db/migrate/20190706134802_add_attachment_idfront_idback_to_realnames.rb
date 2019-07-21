class AddAttachmentIdfrontIdbackToRealnames < ActiveRecord::Migration[5.2]
  def self.up
    change_table :realnames do |t|
      t.attachment :idfront
      t.attachment :idback
    end
  end

  def self.down
    remove_attachment :realnames, :idfront
    remove_attachment :realnames, :idback
  end
end
