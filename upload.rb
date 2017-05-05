require 'goprocam'
require 'aws-sdk'
require 'open-uri'

region = 'us-west-1'
bucket = 'window-stream'
file = './105GOPRO-GOPR7633.MP4'
key = File.basename(file)

puts "uploading: " + file
s3 = Aws::S3::Object.new(
  region: region,
  bucket_name: bucket,
  key: key,
  credentials: Aws::Credentials.new( #gpCamera
    'AKIAI3SKQDQOR3BYLMLA', # access_key_id
    'W1MT9fALd7LFJrFYBzZRvrp8d9p1uI2ILmNvbaYi' # secret_access_key
  ) # session_token
  # ...
).upload_file(file)
