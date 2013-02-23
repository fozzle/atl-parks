class ChangeKmlToText < ActiveRecord::Migration
  def up
  	change_column :parks, :kml, :text, :limit => nil
  end

  def down
  	change_column :parks, :kml, :string
  end
end
