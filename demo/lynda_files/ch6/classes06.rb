class Animal
    # def noise=(noise)
    #     @noise = noise
    # end

    # def noise
    #     @noise
    # end
    def initialize(arms=0, legs=0, noise="Fart") # this is the same as a constructor method in .Net
        @legs = 4
        @arms = arms
        @noise = noise
        puts "animal is instantiated"
    end

    attr_accessor :noise
    attr_accessor :name
    attr_writer :colour
    attr_reader :legs, :arms

    def colour
        puts @colour
    end
end

animal1 = Animal.new(22)
animal1.noise = "Moo" # animal1.noise("Moo")
animal1.name = "Jim"
puts animal1.name

animal1.colour = "Blue"

puts animal1.colour
puts animal1.noise
puts animal1.legs
puts animal1.arms

animal2 = Animal.new
puts animal2.noise