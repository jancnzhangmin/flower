class AddAttachmentProductqrbaseToProductqrs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :productqrs do |t|
      t.attachment :productqrbase
    end
  end

  def self.down
    remove_attachment :productqrs, :productqrbase
  end
end
