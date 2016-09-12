class Station
attr_reader :name, :address, :city, :fuel_type, :distance, :access_time

  dev initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @city = data[:city]
    @fuel_type = data[:fuel_type_code]
    @distance = data[:distance]
    @access_time = data[:access_days_time]


   def self.all_stations(zipcode)
     response = NrelService.new.get_nearest_station(zipcode)
     response[:fuel_stations].map do |data|
       Station.new(data)
     end
   end
end
