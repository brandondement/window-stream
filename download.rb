require 'goprocam'
require 'open-uri'

unless ARGV.count == 1
  puts 'usage: ruby download.rb [prefix]'
  exit
end

filename = ARGV[0]

gpCamera = Camera.new
sleep 1

large_file = gpCamera.get_media()
puts "downloading: " + large_file + " to " + filename

uri = URI(large_file)
Net::HTTP.start(uri.host, uri.port) do |http|
  request = Net::HTTP::Get.new uri
  http.request request do |response|
    open filename, 'w' do |io|
      response.read_body do |chunk|
        io.write chunk
      end
    end
  end
end

puts "downloaded #{filename}"
puts "You should get internet now to upload..."
