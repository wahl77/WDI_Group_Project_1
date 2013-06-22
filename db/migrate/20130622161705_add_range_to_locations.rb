class AddRangeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :range, :integer, default:50, null:false
    Location.update_all ["range = ? ", 30]
  end
end
