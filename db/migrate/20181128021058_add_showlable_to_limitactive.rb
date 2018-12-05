class AddShowlableToLimitactive < ActiveRecord::Migration[5.2]
  def change
    add_column :limitactives, :showlable, :integer
    add_column :limitactives, :summary, :string
  end
end
