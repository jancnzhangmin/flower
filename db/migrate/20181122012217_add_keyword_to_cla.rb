class AddKeywordToCla < ActiveRecord::Migration[5.2]
  def change
    add_column :clas, :keyword, :string
  end
end
