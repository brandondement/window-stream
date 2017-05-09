require 'open_weather'

resp = OpenWeather::Current.city(
  "San Francisco, CA",
  { APPID: 'fc56307bd6990a44569e402e2146a03b' }
)

# require 'pp'
# pp resp

sunrise = Time.at(resp['sys']['sunrise'])
sunset = Time.at(resp['sys']['sunset'])
puts "sunrise: #{sunrise}"
puts "sunset: #{sunset}"

# record at 30 mins before sunrise
puts sunrise.to_i

# record at 1 hr before sunset
