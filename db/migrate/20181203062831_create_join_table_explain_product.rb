class CreateJoinTableExplainProduct < ActiveRecord::Migration[5.2]
  def change
    create_join_table :explains, :products do |t|
      # t.index [:explain_id, :product_id]
      # t.index [:product_id, :explain_id]
    end
  end
end
