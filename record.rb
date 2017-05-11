require 'goprocam'

if ARGV.count == 0
  puts 'usage: ruby record.rb [seconds]'
  exit
end

gpCamera = Camera.new
sleep 1
gpCamera.shutter(Shutter::ON)
sleep ARGV[0].to_i
gpCamera.shutter(Shutter::OFF)
sleep 1
puts 'recorded ' + gpCamera.get_media()
