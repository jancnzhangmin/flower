class AddAttachmentProductimgToProductimgs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :productimgs do |t|
      t.attachment :productimg
    end
  end

  def self.down
    remove_attachment :productimgs, :productimg
  end
end
