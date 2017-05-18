require 'goprocam'

SECS_IN_HOUR = 60 * 60;

# connect to gopro
system("sudo #{Dir.pwd}/connect-to-gopro.sh")

# wait to establish connection
sleep 8

# record
duration = 5 # SECS_IN_HOUR * 1.5
system("ruby #{Dir.pwd}/record.rb #{duration}")

# download
system("ruby #{Dir.pwd}/download.rb")

# connect to home network
system("sudo #{Dir.pwd}/connect-to-home.sh")

# wait to establish connection
sleep 8

# upload
system("ruby #{Dir.pwd}/upload.rb")

# cleanup
system("rm #{Dir.pwd}/*.MP4")
