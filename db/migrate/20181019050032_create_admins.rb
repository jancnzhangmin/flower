class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :login
      t.string :name
      t.string :password_digest
      t.integer :status
      t.string :servicename

      t.timestamps
    end
  end
end
