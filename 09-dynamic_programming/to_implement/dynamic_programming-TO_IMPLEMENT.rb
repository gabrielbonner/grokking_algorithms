require "rspec/autorun"

def find_longest_common_subsequence(str1, str2)
    # TODO:
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
end

