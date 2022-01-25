const testEquality = require('../../testingFunction');

// establish friends and their tools
people = [{
    name: 'You',
    tools: ['ax', 'lawn mower']
}, {
    name: 'Alice',
    tools: ['wheelbarrow', 'drill']
}, {
    name: 'Bob',
    tools: ['pitch fork', 'shovel']
}, {
    name: 'Claire',
    tools: ['pressure washer']
}, {
    name: 'Anuj',
    tools: ['screwdriver', 'rake', '🔨']
}, {
    name: 'Peggy',
    tools: ['leaf blower', 'chainsaw', 'pruning shears']
}, {
    name: 'Thom',
    tools: ['hoe', 'spade', 'gloves']
}, {
    name: 'Jonny',
    tools: ['blower']
}]

// set up person class
class Person {
    constructor(name, tools) {
        this.name = name;
        this.tools = tools;
    }
}

// create an instance of each person
for (person in people) {
    const tools = JSON.stringify(people[person].tools);
    eval(`${people[person].name} = new Person('${people[person].name}', ${tools})`);
}

// set up a relational graph using a WeakMap
// graph['this won't work']
// graph.get('this will work')
graph = new WeakMap();
graph.set(You, [Alice, Bob, Claire]);
graph.set(Bob, [Peggy, Anuj]);
graph.set(Alice, [Peggy]);
graph.set(Claire, [Thom, Jonny]);
graph.set(Anuj, []);
graph.set(Peggy, []);
graph.set(Thom, []);
graph.set(Jonny, []);

// helper function to determine if a person owns a specific tool
const friendHasTool = (friend, desiredTool) => {
    return friend.tools.includes(desiredTool);
}

// implementation of BFS algorithm
const breadthFirstSearch = (personLookingForTool, desiredTool) => {
    // TODO:
}

// TODO: add more tests
testEquality(breadthFirstSearch(You, '🔨'), 'Anuj has a 🔨!')
