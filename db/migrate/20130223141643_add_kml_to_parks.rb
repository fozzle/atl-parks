class AddKmlToParks < ActiveRecord::Migration
  def change
  	add_column :parks, :kml, :string
  end
end
