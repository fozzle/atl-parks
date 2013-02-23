class AddTrailsToParks < ActiveRecord::Migration
  def change
  	add_column :parks, :paved_trails, :integer
  	add_column :parks, :unpaved_trails, :integer
  end
end
