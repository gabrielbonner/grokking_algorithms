const testEquality = (input, expected) => {
    //handle arrays
    if (Array.isArray(input) &&
        (input.length === expected.length &&
        input.every((val, index) => val === expected[index]))) {
        console.log('\x1b[36m%s','Test passed\x1b[0m');
        return true;
    // handle strings and numbers
    } else if (['string', 'number'].includes(typeof(input)) && input === expected) {
        console.log('\x1b[36m%s','Test passed\x1b[0m');
        return true;
    }
    console.error('🛑 \x1b[41mTest failed!\x1b[0m');
    console.error('\u001b[31mActual:\x1b[0m', input);
    console.error('\u001b[31mExpected:\x1b[0m', expected);
    return false;
}

module.exports = testEquality;
