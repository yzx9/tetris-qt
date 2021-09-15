export function random() {

}

const blocks = [
    {
        // 正方形
        states: [
            [ { x: 0, y: 0 }, { x: 0, y: 1 }, { x: 1, y: 0 }, { x: 1, y: 1 } ]
        ],
        weight: 1,
    },
    {
        // 长方形
        states: [
            [ { x: 0, y: 0 }, { x: 0, y: 1 }, { x: 1, y: 0 }, { x: 1, y: 1 } ]
        ],
        weight: 1,
    },
    {
        states: [],
        weight: 1,
    },
    {
        states: [],
        weight: 1,
    },
    {
        states: [],
        weight: 1,
    },
    {
        states: [],
        weight: 1,
    },
    {
        states: [],
        weight: 1,
    },
    {
        states: [],
        weight: 1,
    },
]

const totalWeight = blocks.reduce((sum, { weight }) => sum + weight, 0)
