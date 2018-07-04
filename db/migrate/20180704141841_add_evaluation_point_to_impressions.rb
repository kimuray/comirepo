class AddEvaluationPointToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :evaluation_point, :float, default: 0, null: false
    add_column :impressions, :comic_volume, :integer
    remove_column :impressions, :best_scene
  end
end
