class CreatePostagerules < ActiveRecord::Migration[5.2]
  def change
    create_table :postagerules do |t|
      t.string :name
      t.float :startpostage
      t.float :ordernumber
      t.float :endpostage
      t.integer :status

      t.timestamps
    end
  end
end
