const testEquality = require('../../testingFunction');


const longestCommonSubstring = (str1, str2) => {
    // TODO:
};


testEquality(longestCommonSubstring('HISH', 'FISH'), 3);
testEquality(longestCommonSubstring('DOG', 'CAT'), 0);
testEquality(longestCommonSubstring('HOUSE', 'HOUSE'), 5);
testEquality(longestCommonSubstring('HOUSES', 'HOUSE'), 5);
testEquality(longestCommonSubstring('', ''), 0);
testEquality(longestCommonSubstring('CAT', 'cat'), 0);
