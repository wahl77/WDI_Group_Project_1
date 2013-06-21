class NameInLocationTable < ActiveRecord::Migration
  def change
    remove_column :locations, :user_id_id
    add_column :locations, :name, :string
    add_column :locations, :gmaps, :boolean
  end
end
