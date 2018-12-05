class AddShowlableToBuyfullactive < ActiveRecord::Migration[5.2]
  def change
    add_column :buyfullactives, :showlable, :integer
    add_column :buyfullactives, :summary, :string
  end
end
