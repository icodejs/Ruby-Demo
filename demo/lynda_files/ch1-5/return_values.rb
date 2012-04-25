
def welcome(name="World")
    return "Hello #{name}"
end

def add_and_subtract(n1=0, n2=0)
    add = n1 + n2
    sub = n1 - n2
    return [add, sub] # the square brackets can be left off
end

def longest_word(words=[])
    longest_word = words.inject do |mem, word|
        mem.length > word.length ? mem : word
    end
    return longest_word
end

def over_five?(value=nil)
    return "Exactly 5" if value.to_i == 5
    if value.to_i > 5
        return "Over 5"
    else
        return "Under 5"
    end
end

welcome("Tahir")
welcome("Tyrone")
welcome

fruits = ['apple', 'pear', 'banana', 'plum']
puts longest_word(fruits).length
longest_word

puts over_five?(8)
puts over_five?
puts over_five?(98734 / 4)

return_value = welcome('tyrone j')

puts return_value

result = add_and_subtract(2, 2)
puts result[0]
puts result[1]

add, sub = add_and_subtract(5, 6) # add, sub is the same as [add, sub]

puts add
puts sub
