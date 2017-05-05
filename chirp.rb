require 'goprocam'

gpCamera = Camera.new
gpCamera.locate(Locate::Start)
sleep 1
gpCamera.locate(Locate::Stop)
