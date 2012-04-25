# Two ways to open files for reading/writing

# 1. Instantiate a file object, give it instructions
file = File.new('file1.txt', 'w')
file.puts "Ruby"
file.print "programming\n"
file.write "is "
file << "fun"
file.close

# 2. Provide a file with a block of instructions
File.open('file1.txt', 'r') do |file|
    while line = file.gets
        puts "** " + line.chomp.reverse + " **"
    end
end

# If you know you want to read every line, each_line will be easier
File.open('file1.txt', 'r') do |file|
    file.each_line { |line| puts line.upcase }
end

# second argument is the 'mode': r, w, a, r+, w+, a+
# File Access Modes
# -----------------
# r = Read from the start (must exist)
# w = Truncate/Write from the start (will wipe the file clean)
# a = Append/Write fro the end

# Append a '+' to do both Read & Write

# r+ will be the most useful