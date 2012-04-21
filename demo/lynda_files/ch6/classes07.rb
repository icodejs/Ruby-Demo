class Animal

    attr_accessor :noise
    attr_accessor :name
    attr_writer :colour
    attr_reader :legs, :arms

    def initialize(noise="Fart") # this is the same as a constructor method in .Net
        @legs = 4
        @arms = arms
        @noise = noise
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

puts Animal.shared_method

animal1 = Animal.new(22)
animal1.noise = "Moo" # animal1.noise("Moo")
animal1.name = "Jim"
animal1.colour = "Blue"

# puts animal1.name
# puts animal1.colour
# puts animal1.noise
# puts animal1.legs
# puts animal1.arms


animal2 = Animal.create_with_attributes("Quack", "Black")
puts animal2.noise
puts animal2.colour
