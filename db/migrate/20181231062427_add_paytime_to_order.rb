class AddPaytimeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :paytime, :datetime
    add_column :orders, :commentstatus, :integer
    add_column :orders, :autocommenttime, :datetime
  end
end
