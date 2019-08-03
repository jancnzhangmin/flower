class CreatePostareas < ActiveRecord::Migration[5.2]
  def change
    create_table :postareas do |t|
      t.bigint :postagerule_id
      t.string :adcode
      t.string :province

      t.timestamps
    end
  end
end
