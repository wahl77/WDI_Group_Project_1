class AddGeocodeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :is_ip, :boolean, default:false
    Location.update_all ["is_ip = ?", false]
  end
end
