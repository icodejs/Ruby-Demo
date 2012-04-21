class Animal
    # def noise=(noise)
    #     @noise = noise
    # end

    # def noise
    #     @noise
    # end

    attr_accessor :noise
    attr_accessor :name
    attr_writer :colour
    attr_reader :legs, :arms

    def colour
        puts @colour
    end
end

animal1 = Animal.new
animal1.noise = "Moo" # animal1.noise("Moo")
animal1.name = "Jim"
puts animal1.name

animal1.colour = "Blue"

puts animal1.colour
puts animal1.noise

animal2 = Animal.new
animal2.noise = "Quack" # animal2.noise("Quack")
puts animal2.noise