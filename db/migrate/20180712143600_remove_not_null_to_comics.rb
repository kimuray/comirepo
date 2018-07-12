class RemoveNotNullToComics < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comics, :title_kana, true
    change_column_null :comics, :title_en, true
  end
end
