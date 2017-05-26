#!/usr/bin/ruby
require 'open_weather'
# require 'pp'

SECS_IN_HOUR = 60 * 60;

resp = OpenWeather::Current.city(
  "San Francisco, CA",
  { APPID: 'fc56307bd6990a44569e402e2146a03b' }
)
# pp resp

# start recording 30 mins before sunrise
sunrise_start = Time.at(resp['sys']['sunrise']) - (SECS_IN_HOUR / 2)
system("echo 'ruby #{Dir.pwd}/task.rb' | at #{sunrise_start.strftime "%H:%M"}")

# start recording 1 hr before sunset
sunset_start = Time.at(resp['sys']['sunset']) - SECS_IN_HOUR
system("echo 'ruby #{Dir.pwd}/task.rb' | at #{sunset_start.strftime "%H:%M"}")
