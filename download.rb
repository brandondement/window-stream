require 'goprocam'
require 'open-uri'

# cant connect to camera

gpCamera = Camera.new
# puts gpCamera.overview()
sleep 1
# puts gpCamera.list_media() # json

large_file = gpCamera.get_media()
puts "downloading: " + large_file

uri = URI(large_file)

Net::HTTP.start(uri.host, uri.port) do |http|
  request = Net::HTTP::Get.new uri
  http.request request do |response|
    open "video.MP4", 'w' do |io|
      response.read_body do |chunk|
        io.write chunk
      end
    end
  end
end

puts "downloaded: " + large_file
puts "You should get internet now to upload..."
