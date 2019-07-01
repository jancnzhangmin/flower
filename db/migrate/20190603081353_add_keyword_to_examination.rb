class AddKeywordToExamination < ActiveRecord::Migration[5.2]
  def change
    add_column :examinations, :keyword, :string
  end
end
