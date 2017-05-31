require 'goprocam'

SECS_IN_HOUR = 60 * 60;

# connect to gopro
system("sudo #{ENV['WS_HOME']}/connect-to-gopro.sh")

# wait to establish connection
sleep 8

# record
duration = SECS_IN_HOUR * 1.5
system("ruby #{ENV['WS_HOME']}/record.rb #{duration}")

# download
system("ruby #{ENV['WS_HOME']}/download.rb")

# connect to home network
system("sudo #{ENV['WS_HOME']}/connect-to-home.sh")

# wait to establish connection
sleep 8

# upload
system("ruby #{ENV['WS_HOME']}/upload.rb")

# cleanup
system("rm ~/*.MP4")
