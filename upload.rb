require 'goprocam'
require 'aws-sdk'
# require 'open-uri'

region = 'us-west-1'
bucket = 'window-stream'
file = `ls ~/*.MP4`.to_s.strip
puts file.inspect
key = File.basename(file)

puts "uploading: " + file
s3 = Aws::S3::Object.new(
  region: region,
  bucket_name: bucket,
  key: key,
  credentials: Aws::Credentials.new( #gpCamera
    ENV['AWS_ACCESS_KEY_ID'], # access_key_id
    ENV['AWS_SECRET'] # secret_access_key
  ) # session_token
  # ...
).upload_file(file)
# puts s3.object
