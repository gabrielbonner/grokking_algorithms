const testEquality = require('../../testingFunction');


const longestCommonSubstring = (str1, str2) => {
    // set highest substring count to 0
    let highestSubstringCount = 0;
    const lengthStr1 = str1.length;
    const lengthStr2 = str2.length;
    // define grid, fill with null values
    let grid = new Array(lengthStr1 + 1).fill(null).map(x => new Array(lengthStr2 + 1).fill(null))
    // for loop for every row
    for (let x = 0; x < lengthStr1 + 1; x++) {
        // for loop for every column
        for (let y = 0; y < lengthStr2 + 1; y++) {
            // fill first column and row with zeros (to make adding +1 easier later)
            if (x === 0 || y === 0) {
                grid[x][y] = 0;
            // if row char matches column char
            } else if (str1[x - 1] === str2[y - 1]) {
                // fill cell with +1 of the cell to the top left
                const previousHighestLocalCount = grid[x - 1][y - 1];
                const newHighestLocalCount = previousHighestLocalCount + 1;
                grid[x][y] = newHighestLocalCount;
                // check and update highest substring count
                if (newHighestLocalCount > highestSubstringCount) highestSubstringCount = newHighestLocalCount;
            // else they don't match, so reset local count back to zero
            } else {
                grid[x][y] = 0;
            }
        }
    }
    return highestSubstringCount;
};


testEquality(longestCommonSubstring('HISH', 'FISH'), 3);
testEquality(longestCommonSubstring('DOG', 'CAT'), 0);
testEquality(longestCommonSubstring('HOUSE', 'HOUSE'), 5);
testEquality(longestCommonSubstring('HOUSES', 'HOUSE'), 5);
testEquality(longestCommonSubstring('', ''), 0);
testEquality(longestCommonSubstring('CAT', 'cat'), 0);
