# Open the file and read all lines
lines = File.readlines(ARGV[0])

# Pick a random line
random_line = lines.sample

# Print the random line
puts random_line
