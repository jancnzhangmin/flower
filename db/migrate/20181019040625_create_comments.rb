class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.bigint :product_id
      t.text :comment
      t.bigint :up_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
