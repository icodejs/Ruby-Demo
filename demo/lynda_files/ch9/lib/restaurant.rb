class Restaurant

    attr_accessor :name, :cuisine, :price

    @@filepath = nil

    def self.filepath=(path=nil)
        @@filepath = File.join(APP_ROOT, path)
    end

    def self.file_exists?
        # class should know if the restaurant file exists
        if @@filepath && File.exists?(@@filepath)
            return true
        else
            return false
        end
    end

    def self.file_usable?
        return false unless @@filepath
        return false unless File.exists?(@@filepath)
        return false unless File.readable?(@@filepath)
        return false unless File.writable?(@@filepath)
        return true
    end

    def self.create_file
        # create the restaurant file
        File.open(@@filepath, 'w') unless file_exists?
        return file_usable?
    end

    def self.saved_restaurants
        # read the restaurant file
        # this array could be refactored so that the file system is not checked
        # everytime by making restaurants[] an instance method, and checking
        # whether it has a value or not
        restaurants = []
        if file_usable?
            file = File.new(@@filepath, 'r')
            file.each_line do |line|
                # for each line in our text file create an instance of
                # Restaurant and add it to the restaurants array
                restaurants << Restaurant.new.import_line(line.chomp)
            end
            file.close
        end
        # return instances of restaurant
        return restaurants
    end

    def self.build_from_questions
        args = {}
        print "Restaurant name: "
        args[:name] = gets.chomp.strip

        print "Cuisine type: "
        args[:cuisine] = gets.chomp.strip

        print "Average price: "
        args[:price] = gets.chomp.strip

        return self.new(args)
    end

    # //////////////////// instance methods ////////////////////
    def initialize(args={})
        @name    = args[:name]    || ""
        @cuisine = args[:cuisine] || ""
        @price   = args[:price]   || ""
    end

    def import_line(line)
        line_array = line.split("\t")
        @name, @cuisine, @price = line_array
        # return self is used so that when this is called it can be used to
        # assign the return object to the restaurants array
        return self
    end

    def save
        # we have to append on the class name as we are accessing a class method
        # from this instance method
        return false unless Restaurant.file_usable?
        File.open(@@filepath, 'a') do |file|
            file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
            return true
        end
    end
end