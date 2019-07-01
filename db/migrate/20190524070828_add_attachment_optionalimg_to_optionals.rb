class AddAttachmentOptionalimgToOptionals < ActiveRecord::Migration[5.2]
  def self.up
    change_table :optionals do |t|
      t.attachment :optionalimg
    end
  end

  def self.down
    remove_attachment :optionals, :optionalimg
  end
end
