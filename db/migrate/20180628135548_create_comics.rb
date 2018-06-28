class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title, index: true, null: false
      t.string :title_kana, index: true, null: false
      t.string :title_en, index: true, null: false
      t.string :initial_char

      t.timestamps
    end
  end
end
