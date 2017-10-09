require 'aws-sdk'

unless ARGV.count == 1
  puts "usage: ruby verify [suffix]"
  exit
end

suffix = ARGV[0]
filename = "#{Time.now.strftime("%Y-%m-%d")}-#{suffix}.mp4"

begin
  s3 = Aws::S3::Client.new.get_object({
      bucket: 'window-stream',
      key: filename
  })
rescue Aws::S3::Errors::NoSuchKey
  Aws::SNS::Topic.new({
    arn:'arn:aws:sns:us-west-1:094700156474:ws-upload-failed'
  }).publish({message: "s3://window-stream/#{filename} doesn't exist!"})
end
