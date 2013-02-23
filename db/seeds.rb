# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require('csv')

class String
	def to_bool
		return true if self == "1"
		return false if self == "0"
		raise ArgumentError.new("Invalid value for boolean conversion: \"#{self}\"")
	end
end

count = 0
CLASSIFY = {"B" => "block", 
						"G" => "garden", 
						"N" => "neighborhood", 
						"R" => "regional", 
						"C" => "community",
						"NP" => "nature preserve",
						"SF" => "special facility",
						"CC" => "community center",
						"CN" => "conservation nature preserve"}
@parsed = CSV.foreach("db/parkdata.csv") do |row| 
	# Discard first row
  if (count >= 1)
    park = Park.new
    park.name = row[1]
    park.classification =  CLASSIFY.has_key?(row[2].strip) ? CLASSIFY[row[2].strip] : row[2].strip
    park.address = row[5]
    park.gis_ac = row[6]
    park.zip_code = row[7].to_i
    park.pavilions = row[10].blank? ? 0 : row[10].to_i 
    park.playgrounds = row[11].blank? ? 0 : row[11].to_i 
    park.picnic_shelters = row[12].blank? ? 0 : row[12].to_i 
    park.gazebos = row[13].blank? ? 0 : row[13].to_i 
    park.picnic_tables = row[14].blank? ? 0 : row[14].to_i 
    park.grills = row[15].blank? ? 0 : row[15].to_i 
    park.restrooms = row[16].blank? ? 0 : row[16].to_i 
    park.parking_spaces = row[17].blank? ? 0 : row[17].to_i 
    park.ball_fields = row[18].blank? ? 0 : row[18].to_i 
    park.soccer_fields = row[19].blank? ? 0 : row[19].to_i 
    park.tennis_courts = row[20].blank? ? 0 : row[20].to_i 
    park.basketball_courts = row[23].blank? ? 0 : row[23].to_i 
    park.volleyball_courts = row[24].blank? ? 0 : row[24].to_i 
    park.pool = row[25].blank? ? false : row[25].to_bool 
    park.gym = row[26].blank? ? false : row[26].to_bool 
    park.recreation_center = row[27].blank? ? false : row[27].to_bool 
    park.covbb = row[28].blank? ? false : row[28].to_bool 
    park.dog_park = row[29].blank? ? false : row[29].to_bool 
    park.track = row[30].blank? ? false : row[30].to_bool 
    park.nat = row[31].blank? ? false : row[31].to_bool 
    park.golf = row[32].blank? ? false : row[32].to_bool 
    park.area = row[33].to_f
    park.save
  end
  count += 1
end