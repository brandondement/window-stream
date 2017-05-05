require 'open_weather'
require 'json'
require 'pp'

# get current weather by city name
options = { APPID: 'fc56307bd6990a44569e402e2146a03b' }
resp = OpenWeather::Current.city(
  "San Francisco, CA",
  options
)
pp resp
sys = resp['sys']
sunrise = Time.at(sys['sunrise'])
sunset = Time.at(sys['sunset'])
puts "sunrise: #{sunrise}"
puts "sunset: #{sunset}"
