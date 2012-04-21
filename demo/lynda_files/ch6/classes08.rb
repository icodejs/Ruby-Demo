class Animal

    # class variable
    @@species = ['cat', 'cow', 'dog', 'mouse ']
    @@total_animals = 0

    def self.all_species
        @@species
    end

    attr_accessor :noise
    attr_accessor :name
    attr_writer :colour
    attr_reader :legs, :arms

    def initialize(noise="Fart") # this is the same as a constructor method in .Net
        @legs = 4
        @arms = arms
        @noise = noise
        @@total_animals += 1
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

puts Animal.all_species.inspect

puts Animal.shared_method


