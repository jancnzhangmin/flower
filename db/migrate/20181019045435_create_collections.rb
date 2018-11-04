class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.bigint :user_id
      t.bigint :product_id

      t.timestamps
    end
  end
end
