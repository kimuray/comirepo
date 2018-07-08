class AddComicIdToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_reference :impressions, :comic, index: true, foreign_key: true
  end
end
