require 'goprocam'

SECS_IN_HOUR = 60 * 60;

unless ARGV.count == 1
  puts 'usage: ruby task.rb [suffix]'
  exit
end

suffix = ARGV[0]
filename = "#{ENV['WS_HOME']}/#{Time.now.strftime("%Y-%m-%d")}-#{suffix}.mp4"

# connect to gopro
system("sudo #{ENV['WS_HOME']}/connect-to-gopro.sh")

# wait to establish connection
sleep 8

# record
duration = SECS_IN_HOUR * 1.5
system("ruby #{ENV['WS_HOME']}/record.rb #{duration}")

# download
system("ruby #{ENV['WS_HOME']}/download.rb #{filename}")

# connect to home network
system("sudo #{ENV['WS_HOME']}/connect-to-home.sh")

# wait to establish connection
sleep 8

# upload
system("ruby #{ENV['WS_HOME']}/upload.rb #{filename}")

# cleanup
system("rm #{filename}")
