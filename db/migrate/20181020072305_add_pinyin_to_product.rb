class AddPinyinToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fullpinyin, :string
    add_column :products, :pinyin, :string
  end
end
