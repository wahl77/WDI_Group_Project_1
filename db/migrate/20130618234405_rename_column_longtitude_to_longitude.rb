class RenameColumnLongtitudeToLongitude < ActiveRecord::Migration
  def change
    rename_column :locations, :longtitute, :longitude
  end
end
