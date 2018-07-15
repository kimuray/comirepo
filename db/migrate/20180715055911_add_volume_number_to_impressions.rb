class AddVolumeNumberToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :volume_number, :integer
  end
end
