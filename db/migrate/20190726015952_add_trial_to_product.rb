class AddTrialToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :trial, :integer
  end
end
