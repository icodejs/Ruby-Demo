# Absolute paths

# Use forward slashes, even in Windows
puts "/Users/Tyrone/Desktop/"

# Using File.join is platform independent as it will put in the correct slashed depending on the os
puts File.join('', 'Users', 'tyrone', 'Sites', 'ruby', 'demo', 'lynda_files', 'ch8')

# file is the current file we are in
puts __FILE__

# expand_path will convert a relative path to an absolut path
# in this case it will return the full path to the file
puts File.expand_path(__FILE__)

# relative paths are easiest when you start with this file's directory
puts File.dirname(__FILE__)

# .. "moves back" one directory
puts File.join(File.dirname(__FILE__), '..', "ch6")

# Notes: File paths
# Absolute path: /path/to/file (this will start at the root harddrive and work up)

# Relative path: ./../../path/to/file (../ = parent dir. ./ = current dir