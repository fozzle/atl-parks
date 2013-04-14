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

  # Scope that filters parks with the given amenity.
  # Can run specific conditions or infer from the field type.
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

  # Helper method that can take in params and remove keys that are not amenities.
  # Calls with_amenity for each amenity.
  def self.with_amenities(params)
    amenities = params.reject {|key, value| value != '1' or not AMENITIES.include?(key)}
    scope = self.scoped

    amenities.keys.each do |amenity|
      scope = scope.with_amenity(amenity)
    end

    scope
  end
end
