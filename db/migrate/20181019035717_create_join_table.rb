class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clas, :products do |t|
      # t.index [:cla_id, :product_id]
      # t.index [:product_id, :cla_id]
    end
  end
end
