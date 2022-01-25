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
    // init a search queue variable
    let searchQueue = []
    // add initial person's friends to that queue
    graph.get(personLookingForTool).forEach(friend => searchQueue.push(friend));
    // init variable to keep track of searched persons
    let searched = []

    // while queue has people
    while (searchQueue.length) {
        // get friend and remove them from queue
        let friend = searchQueue.shift()
        // if friend has tool
        if (friendHasTool(friend, desiredTool)) {
            // notify user that friend has tool, and we're done!
            return `${friend.name} has a ${desiredTool}!`
        // ...if friend doesn't have tool
        } else {
            // add friend to searched list
            searched.push(friend)
            // add friend's friends to queue
            graph.get(friend).forEach(friend => searchQueue.push(friend))
        }
    }

    // notify user they are SOL
    return `No one has a ${desiredTool} :(`
}

// TODO: add more tests
testEquality(breadthFirstSearch(You, '🔨'), 'Anuj has a 🔨!')
