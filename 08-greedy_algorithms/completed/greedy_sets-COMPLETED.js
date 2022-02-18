const testEquality = require('../../testingFunction');

const getIntersection = (set1, set2) => {
    return new Set([...set1].filter(item => set2.has(item)));
}

const getDifference = (set1, set2) => {
    return new Set([...set1].filter(item => !set2.has(item)));
}

const getUnion = (set1, set2) => {
    return new Set([...set1].concat([...set2]));
}

statesNeeded = new Set(['mt', 'wa', 'or', 'id', 'nv', 'ut', 'ca', 'az'])

stations = {
    kone: new Set(['id', 'nv', 'ut']),
    ktwo: new Set(['wa', 'id', 'mt']),
    kthree: new Set(['or', 'nv', 'ca']),
    kfour: new Set(['nv', 'ut']),
    kfive: new Set(['ca', 'az']),
}

finalStations = [];

while ([...statesNeeded].length) {
    bestStation = null;
    statesCovered = new Set();
    Object.keys(stations).forEach(station => {
        statesForStation = stations[station]
        covered = getIntersection(statesNeeded, statesForStation)
        if ([...covered].length > [...statesCovered].length) {
            bestStation = station;
            statesCovered = covered;
        }
    });
    statesNeeded = getDifference(statesNeeded, statesCovered)
    finalStations.push(bestStation)
}

testEquality(finalStations, ['kone', 'ktwo', 'kthree', 'kfive']);
