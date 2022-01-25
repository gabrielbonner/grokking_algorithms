const testEquality = (input, expected) => {
    if (input === expected) {
        console.log('\x1b[36m%s','Test passed\x1b[0m');
        return true;
    }
    console.error('🛑 \x1b[41mTest failed!\x1b[0m');
    console.error('\u001b[31mActual:\x1b[0m', input);
    console.error('\u001b[31mExpected:\x1b[0m', expected);
    return false;
}

module.exports = testEquality;
