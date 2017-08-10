require 'goprocam'
require 'aws-sdk'

unless ARGV.count == 1
  puts "usage: ruby upload [filename]"
  exit
end

filename = ARGV[0]
puts "uploading: " + filename

s3 = Aws::S3::Object.new(
  region: 'us-west-1',
  bucket_name: 'window-stream',
  key: File.basename(filename),
  credentials: Aws::Credentials.new( #gpCamera
    ENV['AWS_ACCESS_KEY_ID'], # access_key_id
    ENV['AWS_SECRET'] # secret_access_key
  ) # session_token
  # ...
).upload_file(filename)

system("rm #{filename}")
