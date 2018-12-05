class AddShowlableToSecondactive < ActiveRecord::Migration[5.2]
  def change
    add_column :secondactives, :showlable, :integer
  end
end
