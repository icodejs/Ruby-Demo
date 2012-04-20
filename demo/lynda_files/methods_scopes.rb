value = 7

def welcome
    puts "Hello World"
end

def add
    puts 1 + 1
end

@words = ['apple', 'pear', 'banana', 'plum']

def longest_word

    longest_word = @words.inject do |mem, word|
        mem.length > word.length ? mem : word
    end
    puts longest_word
end

def over_five?
    value = 3
    puts value > 5 ? 'Over 5' : 'Not over 5'
end

welcome
add
longest_word
over_five?

puts value

# puts longest_word