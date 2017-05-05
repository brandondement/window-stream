require 'goprocam'

gpCamera = Camera.new
# puts gpCamera.overview()
sleep 1
# gp.power_on()
gpCamera.camera_mode(Mode::VideoMode, Mode::SubMode::Video::TimeLapseVideo)
sleep 1
gpCamera.shutter(Shutter::ON)
sleep 5
gpCamera.shutter(Shutter::OFF)
sleep 1
puts gpCamera.get_media()
