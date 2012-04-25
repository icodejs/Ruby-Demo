# Two ways to open files for reading/writing

# 1. Instantiate a file object, give it instructions
file = File.new('file1.txt', 'w')
file.puts "Ruby"
file.print "programming\n"
file.write "is "
file << "fun"
file.close

# 2. Provide a file with a block of instructions
# The good thing about using open is that you dont have to worry about closing the
# file as this is done for you automatically when the method is done.
File.open('file1.txt', 'r') do |file|
    # read data from the file
end

# second argument is the 'mode': r, w, a, r+, w+, a+
# File Access Modes
# -----------------
# r = Read from the start (must exist)
# w = Truncate/Write from the start (will wipe the file clean)
# a = Append/Write fro the end

# Append a '+' to do both Read & Write

# r+ will be the most useful