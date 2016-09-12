class NrelService

  def initialize
    @connection = Faraday.new("http://developer.nrel.gov")
    connection.params["api_key"] = ENV[NREL_API_KEY]
  end

  def get_nearest_station(params)
    parse(connection.get("/api/alt-fuel-stations/v1/nearest.json"), params)
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
