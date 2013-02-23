class AddLatLongToPark < ActiveRecord::Migration
  def change
  	add_column :parks, :lat, :decimal, :precision => 13, :scale => 10
  	add_column :parks, :long, :decimal, :precision => 13, :scale => 10
  end
end
