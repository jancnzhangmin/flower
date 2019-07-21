class AddExamintypeToExaminationdetail < ActiveRecord::Migration[5.2]
  def change
    add_column :examinationdetails, :examintype, :integer
  end
end
