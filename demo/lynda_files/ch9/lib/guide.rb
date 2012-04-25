# This will be the controller class

# do not have to provide the full path due to the code init.rb
#  ($:.unshift(File.join(APP_ROOT, 'lib')))
require 'restaurant'
require 'support/string_extend'
class Guide

    class Config
        @@actions = ['list', 'find', 'add', 'quit']
        def self.actions; @@actions; end
        # same as this >>
        # def self.actions
        #     @@actions
        # end
    end


    def initialize(path=nil)
        # lcoate the restaurant text file at path
        Restaurant.filepath = path
        if Restaurant.file_usable?
            puts "Found restaurant file"
        # or create a new file
        elsif Restaurant.create_file
            puts "Created restaurant file"
        # exit if create fails
        else
            puts "Exiting. \n\n"
            exit!
        end
    end

    def launch!
        introduction
        # action loop
        result = nil
        until result == :quit
            #   do action
            action, args = get_action
            result = do_action(action, args)
            # repeat until user quits
        end
        conclusion
    end

    def get_action
        #   what do you want to do (list, find, add, quit)
        action = nil
        # keep asking for user input until we get a valid action
        until Guide::Config.actions.include?(action)
            # lets the user know what actions are available
            puts "Actions: " + Guide::Config.actions.join(", ") if action
            print "> "
            user_response = gets.chomp
            args = user_response.downcase.strip.split(' ')
            # shift: http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-shift
            # Returns the first element of self and removes it (shifting all
            # other elements down by one). Returns nil if the array is empty.
            action = args.shift
        end
        return action, args
    end

    def do_action(action, args=[])
        case action
        when 'list'
            list(args)
        when 'find'
            keyword = args.shift
            find(keyword)
        when 'add'
            add # call the add method
        when 'quit'
            return :quit
        else
            puts "\nI don't understand that command.\n"
        end
    end

    def find(keyword="")
        output_action_header("Find a restaurant")
        if keyword
            # search
            restaurants = Restaurant.saved_restaurants
            found = restaurants.select do |rest|
                rest.name.downcase.include?(keyword.downcase) ||
                rest.cuisine.downcase.include?(keyword.downcase) ||
                rest.price.to_i <= keyword.to_i
            end
            output_restaurant_table(found)
        else
            puts "Find using a key phrase to search the restaurant list."
            puts "Examples: 'find Pizz Hit', 'Pita', 'Cafe'\n\n"
        end
    end

    def add
        output_action_header("Add a restaurant")
        restaurant = Restaurant.build_from_questions
        if restaurant.save
            puts "\nRestaurant added\n\n"
        else
            puts "\nSave Error: Restaurant not added\n\n"
        end
    end

    def list(args=[])
        sort_order = args.shift
        sort_order = args.shift if sort_order == 'by'
        # the sort order is equal to name, if the input is not one of the values in the array below
        # this make sure we get some valid input
        sort_order = "name" unless ['name', 'cuisine', 'price'].include?(sort_order)


        output_action_header("Listing restaurant")
        restaurants = Restaurant.saved_restaurants
        restaurants.sort! do |r1, r2|
            case sort_order
            when 'name'
                r1.name.downcase <=> r2.name.downcase
            when 'cuisine'
                r1.cuisine.downcase <=> r2.cuisine.downcase
            when 'price'
                r1.price.to_i <=> r2.price.to_i
            end
        end
        output_restaurant_table(restaurants)
        puts "Sort using: 'list cuisine' or 'list by cuisine\n\n"
    end

    def introduction
        puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
        puts "This is an interactive guide to help you find the food you crave\n\n"
    end

    def conclusion
        puts "\n<<< Goodbye and Bon Apetit >>>\n\n\n"
    end

    private

    def output_action_header(text)
        puts "\n#{text.upcase.center(60)}\n\n"
    end

    def output_restaurant_table(restaurants=[])
        print " " + "Name".ljust(30)
        print " " + "Cuisine".ljust(20)
        print " " + "Price".rjust(6) + "\n"
        puts  "-" * 60
        restaurants.each do |rest|
            line = " " << rest.name.titleize.ljust(30)
            line << " " + rest.cuisine.titleize.ljust(20)
            line << " " + rest.formatted_price.rjust(6)
            puts line
        end
        puts "No listings found" if restaurants.empty?
        puts "-" * 60
    end

end
