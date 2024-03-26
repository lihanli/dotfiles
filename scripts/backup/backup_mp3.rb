require './check_credentials'

mp3_dir = ARGV[0]
raise 'pass in mp3 directory' if mp3_dir.nil?
unless Dir.entries(mp3_dir).include?("Flower Travellin' Band - Satori")
  raise 'wrong dir'
end

system('aws', 's3', 'sync', '--delete', "--storage-class='DEEP_ARCHIVE'", mp3_dir, 's3://lihan/backups/mp3')
