require 'goprocam'

if ARGV.count == 0
  puts 'usage: ruby record.rb [seconds]'
  exit
end

gpCamera = Camera.new
sleep 1

gpCamera.sync_time()
sleep 1

gpCamera.camera_mode(Mode::VideoMode, Mode::SubMode::Video::TimeLapseVideo)
sleep 1
# gpCamera.gpControlCommand(Multishot::TIMELAPSE_INTERVAL, Multishot::TimeLapseInterval::I10)
# sleep 1
gpCamera.gpControlCommand(Video::RESOLUTION, Video::Resolution::R1080p)
sleep 1
gpCamera.gpControlCommand(Video::FOV, Video::Fov::Narrow)
sleep 1

gpCamera.shutter(Shutter::ON)
sleep ARGV[0].to_i
gpCamera.shutter(Shutter::OFF)
sleep 1

puts 'recorded ' + gpCamera.get_media()
