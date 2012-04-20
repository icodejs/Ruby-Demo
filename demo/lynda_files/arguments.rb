def welcome(name)
    puts "Hello #{name}"
end

def add(n1, n2)
    puts n1 + n2
end

def longest_word(words)
    longest_word = words.inject do |mem, word|
        mem.length > word.length ? mem : word
    end
    puts longest_word
end

def over_five?(value)
    puts value > 5 ? 'Over 5' : 'Not over 5'
end

welcome("Tahir")
welcome("Tyrone")
welcome "Joseph"
add(2, 2)

fruits = ['apple', 'pear', 'banana', 'plum']

longest_word(fruits)

over_five?(8)

over_five?(98734 / 4)