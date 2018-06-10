class AddCaptureColumnToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :capture, :string
  end
end
