class Park < ActiveRecord::Base
  attr_accessible :address, :area, :ball_fields, :basketball_courts, :classification, :covbb, :dog_park, :gazebos, :gis_ac, :golf, :grills, :gym, :name, :nat, :parking_spaces, :pavilions, :picnic_tables, :picnic_shelters, :playgrounds, :pool, :recreation_center, :restrooms, :soccer_fields, :tennis_courts, :track, :volleyball_courts, :zip_code, :latitude, :longitude, :paved_trails, :unpaved_trails
  reverse_geocoded_by :latitude, :longitude
end
