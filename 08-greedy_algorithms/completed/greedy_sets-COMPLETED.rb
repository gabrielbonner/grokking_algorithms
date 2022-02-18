require "rspec/autorun"
require "set"

def greedy_search(states_needed, stations)
    final_stations = []
    # loop until states_needed is empty
    while states_needed.length > 0 do
        best_station = nil
        states_covered = Set.new
        stations.each { |station_name, states_for_station|
            # find what remaining states this station covers
            covered = states_needed & states_for_station
            # if this station covers the most states, overwrite the previous best station
            if covered.length > states_covered.length
                best_station = station_name
                states_covered = covered
            end
        }
        # remove states_covered from states_needed
        states_needed -= states_covered
        # add best_station to final_stations
        final_stations.push(best_station)
    end
    final_stations
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
