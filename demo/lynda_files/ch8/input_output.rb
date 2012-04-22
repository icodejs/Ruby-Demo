#  gets: waits for user input a single line ending in a return
# chomp: removes any line ending ("\n, \r" etc)
# chop: would remove ANY final character. (chomp is usually better)

input = gets.chomp

# print: outputs a string with no line return
print "you just told me: "

# puts: outputs a string with a line return
puts input + "."

# Use gets inside teh loop for more user input. It suspends the loop while waiting for user input
result = ""
until result == "quit"
    print "> "
    result = gets.chomp
    puts "I heard: #{result}"
end

puts "Goodbye!"