require 'goprocam'

puts `pwd`
gpCamera = Camera.new
sleep 1
gpCamera.shutter(Shutter::ON)
# take input from ARGV
sleep 5
gpCamera.shutter(Shutter::OFF)
sleep 1
puts 'recorded ' + gpCamera.get_media()
