class AddShowlableToAddmoneyactive < ActiveRecord::Migration[5.2]
  def change
    add_column :addmoneyactives, :showlable, :integer
    add_column :addmoneyactives, :summary, :string
  end
end
