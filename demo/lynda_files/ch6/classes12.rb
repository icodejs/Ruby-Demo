class Animal

    # class variable
    @@species = ['cat', 'cow', 'dog', 'mouse ']
    @@current_animals = []

    def self.all_species
        @@species
    end

    # long way
    def self.species
        @@species
    end
    def self.species=(array=[])
        @@species = array
    end

    def self.current_animals
        @@current_animals
    end

    attr_accessor :noise
    attr_accessor :name
    attr_writer :colour
    attr_reader :legs, :arms

    # this is the same as a constructor method in .Net
    def initialize(noise="Fart")
        @legs = 4
        @arms = arms
        @noise = noise
        @@current_animals << self
        puts "animal is instantiated"
    end

    def self.shared_method
        puts "I am a self method (shared / static) method. I dont need to an instance to work!"
    end

    def self.create_with_attributes(noise, colour)
        animal = self.new(noise)
        animal.colour = colour
        return animal
    end

    def colour
        "This colour is #{@colour}."
    end
end

class Cow < Animal
    # This method overrides the colour function in the base class.
    # This can even be done on classes within the Ruby core library like
    # (Array class)
    def colour
        "The cows colour is #{@colour}."
    end
end

class Dog < Animal
    def noise
       # super # call the noise instance on the parent
       # "hello" # same thing as return "Hello"

        parent_noise = super

        return "Hello and also #{parent_noise}"
    end
end

# Animal.species = ['frog', 'fish']
# puts Animal.species.inspect

animal1 = Animal.new(22)
animal1.noise = "Moo" # animal1.noise("Moo")
animal1.name = "Jim"
animal1.colour = "Blue"

puts animal1.name
puts animal1.colour
puts animal1.noise
puts animal1.legs
puts animal1.arms
puts "++++++++++++++++++++"

# animal2 = Animal.create_with_attributes("Quack", "Black")
# puts animal2.noise
# puts animal2.colour

# puts Animal.current_animals.inspect

# basic inheritance
maise = Cow.create_with_attributes("Moo", "Black and White")
puts maise.noise
puts maise.class
puts maise.colour
puts "++++++++++++++++++++"

rover = Dog.new("Bark")
puts rover.noise