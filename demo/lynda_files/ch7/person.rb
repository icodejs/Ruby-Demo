# load 'contact_info.rb' # load in the dependency every time
require 'contact_info.rb' # like load but only does a load if the module hasn't be loaded already
class Person
    include ContactInfo
    # include: is exactly the same as if we copied all the above module code here.
    # This has nothing to do with loading the module into the class. It mearly tells the
    # the class that it needs to be included.
end

require 'contact_info.rb'
class Teacher
    include ContactInfo

    attr_accessor :lesson_plans
end

# now when we want to make a change to contact info we can make it in one place place and this will
# be reflected in all of the classes

# note, that this functionality is also inherited so ...
class Student < Person
    attr_accessor :books, :grades
end