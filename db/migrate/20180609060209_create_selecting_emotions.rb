class CreateSelectingEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :selecting_emotions do |t|
      t.references :impression, foreign_key: true, index: true
      t.references :emotion, foreign_key: true, index: true

      t.timestamps
    end
  end
end
