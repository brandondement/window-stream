require 'goprocam'
require 'aws-sdk'
require 'open-uri'

# cant connect to camera

gpCamera = Camera.new
# puts gpCamera.overview()
sleep 1
# puts gpCamera.list_media() # json
file = gpCamera.get_media()
puts "downloading: " + file
gpCamera.dl_media() # open-uri: file.puts f.read
puts "downloaded: " + file
