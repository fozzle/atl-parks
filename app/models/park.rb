class Park < ActiveRecord::Base
	serialize :kml, Array
  attr_accessible :address, :area, :ball_fields, :basketball_courts, :classification, :covbb, :dog_park, :gazebos, :gis_ac, :golf, :grills, :gym, :name, :nat, :parking_spaces, :pavilions, :picnic_tables, :picnic_shelters, :playgrounds, :pool, :recreation_center, :restrooms, :soccer_fields, :tennis_courts, :track, :volleyball_courts, :zip_code, :latitude, :longitude, :paved_trails, :unpaved_trails
  reverse_geocoded_by :latitude, :longitude

  AMENITIES = [ 
                'pavilions',
                'playgrounds',
                'picnic_tables',
                'picnic_shelters',
                'gazebos',
                'restrooms',
                'parking_spaces',
                'grill',
                'ball_fields',
                'soccer_fields',
                'tennis_courts',
                'basketball_courts',
                'volleyball_courts',
                'pool',
                'gym',
                'dog_park',
                'track',
                'nat',
                'golf',
                'unpaved_trails',
                'paved_trails'
              ]

  def self.with_amenity(amenity)
    scoped unless self.columns_hash.has_key?(amenity) and AMENITIES.include?(amenity)

    case amenity
    when 'gym'
      where("gym = 't' OR recreation_center = 't'")
    when 'basketball_courts'
      where("basketball_courts > 0 OR covbb = 't'")
    else
      field_type = self.columns_hash[amenity].type

      case field_type
      when :integer
        where(amenity + " > 0", amenity)
      when :boolean
        where(amenity + " = 't'", amenity)
      else
        scoped
      end
    end
  end
end
