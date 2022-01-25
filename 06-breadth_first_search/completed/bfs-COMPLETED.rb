require "rspec/autorun"

# make a Ruby version of Python's "deque"
class Deque
    attr_reader :items

    def initialize
        @items = []
    end

    def add(items)
        items.each { |item| @items.push(item) }
    end

    def get_next_in_queue
        @items.shift
    end

    def is_not_empty
        @items.length > 0
    end
end

class Person
    attr_reader :name, :tools
    attr_accessor :friends
  
    def initialize(args)
        @name = args.fetch('name', 'Anon')
        @tools = args.fetch('tools', [])
        # comment next line back in to use .friends instead of relational graph
        # @friends = []
    end
end

# establish people and what tools they own
people = [{
        'name' => 'You',
        'tools' => ['ax', 'lawn mower'],
    }, {
        'name' => 'Alice',
        'tools' => ['wheelbarrow', 'drill']
    }, {
        'name' => 'Bob',
        'tools' => ['pitch fork', 'shovel']
    }, {
        'name' => 'Claire',
        'tools' => ['pressure washer']
    }, {
        'name' => 'Anuj',
        'tools' => ['screwdriver', 'rake', '🔨']
    }, {
        'name' => 'Peggy',
        'tools' => ['leaf blower', 'chainsaw', 'pruning shears']
    }, {
        'name' => 'Thom',
        'tools' => ['hoe', 'spade', 'gloves']
    }, {
        'name' => 'Jonny',
        'tools' => ['blower']
}]

# to determine if a person owns a specific tool
def friend_has_tool(friend, desired_tool)
    friend.tools.include?(desired_tool)
end

# implementation of BFS algorithm
def breadth_first_search(person_looking_for_tool, desired_tool)
    # init a search queue variable
    search_queue = Deque.new()

    # add initial person's friends to that queue
    search_queue.add(@graph[person_looking_for_tool])
    # comment next line back in to use .friends instead of relational graph
    # search_queue.add(person_looking_for_tool.friends)

    # init variable to keep track of searched persons
    searched = []

    # while queue has people
    while search_queue.is_not_empty
        # get friend and remove them from queue
        friend = search_queue.get_next_in_queue
        # check whether friend has tool
        if friend && friend_has_tool(friend, desired_tool)
        # if friend has tool
            # notify user that friend has tool, and we're done!
            return "#{friend.name} has a #{desired_tool}!"
        # else if friend doesn't have tool...
        else
            # add friend to searched list
            searched << friend

            # add friend's friends to queue
            search_queue.add(@graph[friend])
            # comment next line back in to use .friends instead of relational graph
            # search_queue.add(friend.friends)

        end
    end

    # notify user they are SOL
    return "Looks like no one you know has access to a #{desired_tool}... :("
end

# tests
describe 'breadth_first_search' do
    # test setup
    before do
        people.each do |person|
            instance_variable_set('@' + person['name'].downcase, Person.new(args=person))
        end
          
        # set up a relational graph
        @graph = {}
        @graph[@you] = [@alice, @bob, @claire]
        @graph[@bob] = [@peggy, @anuj]
        @graph[@alice] = [@peggy]
        @graph[@claire] = [@thom, @jonny]
        @graph[@anuj] = []
        @graph[@peggy] = []
        @graph[@thom] = []
        @graph[@jonny] = []
        # comment next lines back in to use .friends instead of relational graph
        # @you.friends = [@alice, @bob, @claire]
        # @bob.friends = [@peggy, @anuj]
        # @alice.friends = [@peggy]
        # @claire.friends = [@thom, @jonny]
        # @anuj.friends = []
        # @peggy.friends = []
        # @thom.friends = []
        # @jonny.friends = []

    end

    it "verifies that a friend of a friend has a hammer" do
        result = breadth_first_search(@you, '🔨')
        expect(result).to eq('Anuj has a 🔨!')
    end

    # TODO: add more test cases
end
