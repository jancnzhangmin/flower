class AddAttachmentConditionimgToConditions < ActiveRecord::Migration[5.2]
  def self.up
    change_table :conditions do |t|
      t.attachment :conditionimg
    end
  end

  def self.down
    remove_attachment :conditions, :conditionimg
  end
end
