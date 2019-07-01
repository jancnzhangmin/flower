class AddExaminationToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :examination, :integer
  end
end
