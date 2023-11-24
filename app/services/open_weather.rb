class OpenWeather
  def initialize
    @api_key = 'a5a47c18197737e8eeca634cd6acb581'
  end

  def get_forecast(latitude, longitud)
    require "uri"
    require "net/http"
    require 'json'

    url = URI("https://api.openweathermap.org/data/2.5/onecall?lat=#{latitude}&lon=#{longitud}&exclude=current,minutely,hourly,alerts&appid=#{@api_key}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    JSON.parse(response.body)
  end
end