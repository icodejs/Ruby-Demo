# This will be the controller class

# do not have to provide the full path due to the code init.rb
#  ($:.unshift(File.join(APP_ROOT, 'lib')))
require 'restaurant'

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
            action = get_action
            result = do_action(action)
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
            action = user_response.downcase.strip
        end
        return action
    end

    def do_action(action)
        case action
        when 'list'
            puts "Listing..."
        when 'find'
            puts 'Finding...'
        when 'add'
            puts 'Adding...'
        when 'quit'
            return :quit
        else
            puts "\nI don't understand that command.\n"
        end
    end

    def introduction
        puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
        puts "This is an interactive guide to help you find the food you crave\n\n"
    end

    def conclusion
        puts "\n<<< Goodbye and Bon Apetit >>>\n\n\n"
    end

end
