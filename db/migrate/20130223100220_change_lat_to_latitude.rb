class ChangeLatToLatitude < ActiveRecord::Migration
  def change
  	rename_column :parks, :lat, :latitude
  	rename_column :parks, :long, :longitude
  end
end
