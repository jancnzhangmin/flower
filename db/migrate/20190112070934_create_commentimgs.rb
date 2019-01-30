class CreateCommentimgs < ActiveRecord::Migration[5.2]
  def change
    create_table :commentimgs do |t|
      t.bigint :comment_id

      t.timestamps
    end
  end
end
