require 'open_weather'
# require 'pp'

SECS_IN_HOUR = 60 * 60;

resp = OpenWeather::Current.city(
  "San Francisco, CA",
  { APPID: 'fc56307bd6990a44569e402e2146a03b' }
)
# pp resp

cmd = "ruby #{Dir.pwd}/record.rb"

# start recording 30 mins before sunrise
sunrise_start = Time.at(resp['sys']['sunrise']) - (SECS_IN_HOUR / 2)
`echo '#{cmd}' | at #{sunrise_start.strftime "%H:%M"}`

# start recording 1 hr before sunset
sunset_start = Time.at(resp['sys']['sunset']) - SECS_IN_HOUR
`echo '#{cmd}' | at #{sunset_start.strftime "%H:%M"}`
