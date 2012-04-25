def welcome
    puts "Hello World"
end

def add
    puts 1 + 1
end

def longest_word
    words = ['apple', 'pear', 'banana', 'plum']

    longest_word = words.inject do |mem, word|
        mem.length > word.length ? mem : word
    end
    puts longest_word
end

# Method name can have question marks in them
# Useful for test and booleans

def over_five?
    value = 3
    puts value > 5 ? 'Over 5' : 'Not over 5'
end

welcome
add
longest_word
over_five?