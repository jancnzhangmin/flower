class AddTaskToExamination < ActiveRecord::Migration[5.2]
  def change
    add_column :examinations, :task, :float
  end
end
