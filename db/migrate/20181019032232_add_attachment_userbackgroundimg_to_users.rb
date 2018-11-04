class AddAttachmentUserbackgroundimgToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.attachment :userbackgroundimg
    end
  end

  def self.down
    remove_attachment :users, :userbackgroundimg
  end
end
