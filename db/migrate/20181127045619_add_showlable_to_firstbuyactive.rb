class AddShowlableToFirstbuyactive < ActiveRecord::Migration[5.2]
  def change
    add_column :firstbuyactives, :showlable, :integer
    add_column :firstbuyactives, :summary, :string
  end
end
