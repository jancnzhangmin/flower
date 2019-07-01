class AddVcodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :vcode, :string
    add_column :users, :vcodetime, :datetime
  end
end
