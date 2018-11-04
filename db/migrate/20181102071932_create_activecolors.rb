class CreateActivecolors < ActiveRecord::Migration[5.2]
  def change
    create_table :activecolors do |t|
      t.string :name
      t.string :frontcolor
      t.string :shadowcolor

      t.timestamps
    end
  end
end
