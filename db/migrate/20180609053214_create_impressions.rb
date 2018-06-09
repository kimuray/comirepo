class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.integer :user_id, index: true, null: false
      t.string :comic_title
      t.string :best_scene
      t.text :report

      t.timestamps
    end
  end
end
