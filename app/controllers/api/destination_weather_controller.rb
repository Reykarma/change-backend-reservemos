class Api::DestinationWeatherController < ApplicationController
  def index
    city = params[:city]
    data = build_data(city)
    render json: {'data': data}
  rescue StandardError => e
    render json: { 'error': e.message }, status: :unprocessable_entity
  end

  private

  def build_data(city)
    reservamos_api = ReservamosApi.new(city)
    weather_api = OpenWeather.new
    cities = reservamos_api.get_cities
  
    cities.map {|city| city_object(city, weather_api) }
  end 

  def city_object(city, weather_api)
    {
      state: city['state'],
      city_name: city['display'],
      wheather: city_weather(city, weather_api)
    }
  end

  def city_weather(city, weather_api)
    forecast = weather_api.get_forecast(city['lat'], city['long'])
    forecast['daily'].shift
    forecast['daily'].map do |day|
      {
        date: Time.at(day['dt']),
        description: day['weather'].first['description'],
        max_temperature:day['temp']['max'],
        min_temperature:day['temp']['min']
      }
    end
  end
end
