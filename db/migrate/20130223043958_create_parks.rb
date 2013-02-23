class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.string :classification
      t.string :address
      t.decimal :gis_ac
      t.integer :zip_code
      t.integer :pavilions
      t.integer :playgrounds
      t.integer :picnic_shelters
      t.integer :gazebos
      t.integer :picnic_tables
      t.integer :grills
      t.integer :restrooms
      t.integer :parking_spaces
      t.integer :ball_fields
      t.integer :soccer_fields
      t.integer :tennis_courts
      t.integer :basketball_courts
      t.integer :volleyball_courts
      t.boolean :pool
      t.boolean :gym
      t.boolean :recreation_center
      t.boolean :covbb
      t.boolean :dog_park
      t.boolean :track
      t.boolean :nat
      t.boolean :golf
      t.decimal :area

      t.timestamps
    end
  end
end
