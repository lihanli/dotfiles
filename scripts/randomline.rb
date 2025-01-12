# Open the file and read all lines
lines = File.readlines(ARGV[0]).reject { |line| line.strip.empty? }.reject { |line| ['<highlight>', '/<highlight>'].include?(line) }

# Pick a random line
random_line = lines.sample

# Print the random line
puts random_line
