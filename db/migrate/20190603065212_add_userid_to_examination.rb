class AddUseridToExamination < ActiveRecord::Migration[5.2]
  def change
    add_column :examinations, :user_id, :bigint
  end
end
