class AddCommentlevelToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentlevel, :integer
    add_column :comments, :anonymous, :integer
    add_column :comments, :descscore, :float
    add_column :comments, :deliverscore, :float
    add_column :comments, :servicescore, :float
  end
end
