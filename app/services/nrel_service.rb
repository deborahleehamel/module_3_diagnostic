class NrelService

  def initialize
    @connection = Faraday.new("http://developer.nrel.gov")
    connection.params["api_key"] = ENV[NREL_API_KEY]
  end

  def get_nearest_station(zip)
    parse(connection.get("/api/alt-fuel-stations/nearest.json?location=#{zip}&distance=6&limit=10&fuel_type=ELEC,LPG")
    require "pry"; binding.pry
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
