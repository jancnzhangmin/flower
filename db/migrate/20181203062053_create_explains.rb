class CreateExplains < ActiveRecord::Migration[5.2]
  def change
    create_table :explains do |t|
      t.text :explain

      t.timestamps
    end
  end
end
