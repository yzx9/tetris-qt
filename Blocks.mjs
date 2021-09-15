const blocks = [
    {
        // 正方形
        state: 0,
        states: [
            [ { row: 0, col: 0 }, { row: 0, col: 1 }, { row: 1, col: 0 }, { row: 1, col: 1 } ],
        ],
        weight: 1,
    },
    {
        // 柱形
        state: 0,
        states: [
            [ { row: 0, col: 1 }, { row: 1, col: 1 }, { row: 2, col: 1 }, { row: 3, col: 1 } ],
            [ { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 1, col: 2 }, { row: 1, col: 3 } ],
        ],
        weight: 1,
    },
    {
        // 方向键
        state: 0,
        states: [
            [ { row: 0, col: 0 }, { row: 0, col: 1 }, { row: 0, col: 2 }, { row: 1, col: 1 } ],
            [ { row: 0, col: 0 }, { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 2, col: 0 } ],
            [ { row: 0, col: 1 }, { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 1, col: 2 } ],
            [ { row: 0, col: 1 }, { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 2, col: 1 } ],
        ],
        weight: 1,
    },
    {
        // L
        state: 0,
        states: [
            [ { row: 0, col: 0 }, { row: 0, col: 1 }, { row: 1, col: 0 }, { row: 2, col: 0 } ],
            [ { row: 0, col: 0 }, { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 1, col: 2 } ],
            [ { row: 0, col: 1 }, { row: 1, col: 1 }, { row: 2, col: 0 }, { row: 2, col: 1 } ],
            [ { row: 0, col: 0 }, { row: 0, col: 1 }, { row: 0, col: 2 }, { row: 1, col: 2 } ],
        ],
        weight: 1,
    },
    {
        // 反L
        state: 0,
        states: [
            [ { row: 0, col: 0 }, { row: 0, col: 1 }, { row: 1, col: 1 }, { row: 2, col: 1 } ],
            [ { row: 0, col: 0 }, { row: 0, col: 1 }, { row: 0, col: 2 }, { row: 1, col: 0 } ],
            [ { row: 0, col: 0 }, { row: 1, col: 0 }, { row: 2, col: 0 }, { row: 2, col: 1 } ],
            [ { row: 0, col: 2 }, { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 1, col: 2 } ],
        ],
        weight: 1,
    },
    {
        // Z
        state: 0,
        states: [
            [ { row: 0, col: 1 }, { row: 0, col: 2 }, { row: 1, col: 0 }, { row: 1, col: 1 } ],
            [ { row: 0, col: 0 }, { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 2, col: 1 } ],
        ],
        weight: 1,
    },
    {
        // 反Z
        state: 0,
        states: [
            [ { row: 0, col: 0 }, { row: 0, col: 1 }, { row: 1, col: 1 }, { row: 1, col: 2 } ],
            [ { row: 0, col: 1 }, { row: 1, col: 0 }, { row: 1, col: 1 }, { row: 2, col: 0 } ],
        ],
        weight: 1,
    },
]

const totalWeight = blocks.reduce((sum, { weight }) => sum + weight, 0)

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
}

export function random() {
    let i = 0
    let rand = getRandomInt(0, totalWeight)
    for (; rand - blocks[i].weight >= 0;) { rand -= blocks[i].weight; i++; }

    const block = blocks[i]
    block.state = getRandomInt(0, block.states.length)
    return block
}
