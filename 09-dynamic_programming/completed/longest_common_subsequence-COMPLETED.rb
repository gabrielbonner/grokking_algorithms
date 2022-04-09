require "rspec/autorun"

def find_longest_common_subsequence(str1, str2)
    # get length of input strings so that we can build a table
    str1_length = str1.length
    str2_length = str2.length

    # build table / 2-D array to store subproblem results
    table = []
    (0..(str1_length + 1)).each { |i| table.push(Array.new(str2_length)) }
    
    # go through every column
    (0..(str1_length + 1)).each do |i|
        # go through every row (AKA, go through every cell in row)
        (0..str2_length + 1).each do |j|
            table[i][j] = 0
            # fill in first row and column with zeros
            if i == 0 or j == 0
                table[i][j] = 0
            # if the letters match, increase previous max count by one
            elsif str1[i-1] == str2[j-1]
                table[i][j] = table[i-1][j-1] + 1
            # take max of one cell to the left or one cell up
            else
                table[i][j] = [table[i-1][j], table[i][j-1]].max
            end
        end
    end

    # return bottom-rightmost cell
    return table[str1_length][str2_length]
end


# tests here
describe 'dynamic programming' do
    it "tests that the dynamic programming algo works" do
        str1 = "abcde"
        str2 = "ace"

        result = find_longest_common_subsequence(str1, str2)
        expect(result).to eq(3)
    end

    it "also tests that the dynamic programming algo works" do
        str1 = "XMJYAUZ"
        str2 = "MZJAWXU"

        result = find_longest_common_subsequence(str1, str2)
        expect(result).to eq(4)
    end

    it "tests that the dynamic programming algo works, yet again" do
        str1 = "ABCDEFG"
        str2 = "HIJKLMN"

        result = find_longest_common_subsequence(str1, str2)
        expect(result).to eq(0)
    end

    it "tests that the dynamic programming algo works with different length strings" do
        str1 = "ABCDEFG"
        str2 = "HIJKLMN"

        result = find_longest_common_subsequence(str1, str2)
        expect(result).to eq(1)
    end
end
