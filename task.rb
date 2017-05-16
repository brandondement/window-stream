SECS_IN_HOUR = 60 * 60;

# connect to gopro
system("sudo #{Dir.pwd}/connect-to-gopro.sh")
sleep 2

# record
duration = 5 # SECS_IN_HOUR * 1.5
system("ruby #{Dir.pwd}/record.rb #{duration}")
# sleep duration

# connect to home network
system("sudo #{Dir.pwd}/connect-to-home.sh")
sleep 2

# upload
system("ruby #{Dir.pwd}/upload.rb")
