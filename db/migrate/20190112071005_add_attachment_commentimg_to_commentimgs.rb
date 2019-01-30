class AddAttachmentCommentimgToCommentimgs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :commentimgs do |t|
      t.attachment :commentimg
    end
  end

  def self.down
    remove_attachment :commentimgs, :commentimg
  end
end
