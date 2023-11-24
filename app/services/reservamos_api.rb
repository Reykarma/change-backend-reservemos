class ReservamosApi
  def initialize(city_name)
    @base_url = 'https://search.reservamos.mx/api/v2/places?q='
    @city_name = city_name
  end

  def get_all_places
    require "uri"
    require "net/http"
    require 'json'

    url = URI("https://search.reservamos.mx/api/v2/places?q=#{@city_name}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    JSON.parse(response.body)
  end

  def get_cities
    places = get_all_places
    cities = places.select { |place| place["result_type"] == 'city' }
  end
end