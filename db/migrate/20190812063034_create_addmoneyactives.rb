class CreateAddmoneyactives < ActiveRecord::Migration[5.2]
  def change
    create_table :addmoneyactives do |t|
      t.integer :buynumber
      t.integer :givenumber
      t.datetime :begintime
      t.datetime :endtime
      t.integer :status

      t.timestamps
    end
  end
end
