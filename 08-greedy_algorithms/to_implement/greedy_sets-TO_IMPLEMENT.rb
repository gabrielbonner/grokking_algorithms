require "rspec/autorun"
require "set"

def greedy_search(states_needed, stations)
    # TODO:
end

# tests here
describe 'greedy search' do
    it "tests that the greedy search works" do
        states_needed = Set.new(['mt', 'wa', 'or', 'id', 'nv', 'ut', 'ca', 'az'])

        stations = {
            'kone' => Set.new(['id', 'nv', 'ut']),
            'ktwo' => Set.new(['wa', 'id', 'mt']),
            'kthree' => Set.new(['or', 'nv', 'ca']),
            'kfour' => Set.new(['nv', 'ut']),
            'kfive' => Set.new(['ca', 'az']),
        }
        result = greedy_search(states_needed, stations)
        expect(result).to eq(['kone', 'ktwo', 'kthree', 'kfive'])
    end

    # TODO: add more test cases
end
