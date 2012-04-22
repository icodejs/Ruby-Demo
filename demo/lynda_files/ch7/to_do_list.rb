class ToDoList
    include Enumerable

    attr_accessor :items # shortcut for creating getters and setters

    def initialize # construtor method
        @items = []
    end

    # http://www.ruby-doc.org/core/Enumerable.html
    # The class must provide a method each, which yields successive members of the collection.
    def each
        # we need to tell the each method what it will be enumerating
        @items.each { |item| yield item }
    end
end

# now i can do this in > $ irb
# ------------------------------------------

# >> list = ToDoList.new
# => #<ToDoList:0x1004b5ea0 @items=[]>
# >> list.items = ['tyrone', 'joseph', 'tahir']
# => ["tyrone", "joseph", "tahir"]
# >> list.items.select { |i| i.length > 5 }
# => ["tyrone", "joseph"]
