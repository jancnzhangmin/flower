class CreateSysqrs < ActiveRecord::Migration[5.2]
  def change
    create_table :sysqrs do |t|

      t.timestamps
    end
  end
end
