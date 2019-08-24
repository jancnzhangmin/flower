class AddStatusToOrderdeliver < ActiveRecord::Migration[5.2]
  def change
    add_column :orderdelivers, :status, :integer
    add_column :orderdelivers, :message, :text
  end
end
