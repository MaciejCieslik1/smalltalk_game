Object subclass: Movement [
    | communicatesService |

    initialize: newCommunicatesService [
        communicatesService := newCommunicatesService.
    ]

    go: direction [
        (direction = 'n')
        ifTrue: [
            self goNorth
        ].
        (direction = 'w')
        ifTrue: [
            self goWest
        ].
        (direction = 's')
        ifTrue: [
            self goSouth
        ].
        (direction = 'e')
        ifTrue: [
            self goEast
        ].
    ]

    goNorth [
        | adjacentRoom |
        adjacentRoom := hero location adjacentNorth.
        self checkAdjacentRoom: adjacentRoom direction: 'n'.
    ]

    goWest [
        | adjacentRoom |
        adjacentRoom := hero location adjacentWest.
        self checkAdjacentRoom: adjacentRoom direction: 'w'.
    ]

    goSouth [
        | adjacentRoom |
        adjacentRoom := hero location adjacentSouth.
        self checkAdjacentRoom: adjacentRoom direction: 's'.
    ]

    goEast [
        | adjacentRoom |
        adjacentRoom := hero location adjacentEast.
        self checkAdjacentRoom: adjacentRoom direction: 'e'.
    ]

    checkAdjacentRoom: adjacentRoom direction: direction [
        (adjacentRoom ~= nullRoom)
        ifTrue: [
            self checkIfAccessible: adjacentRoom direction: direction.
        ]
        ifFalse: [
            communicatesService noRoom
        ]
    ]

    checkIfAccessible: adjacentRoom direction: direction[
        (adjacentRoom isAccessible = true)
        ifTrue: [
            self checkIfPassage: adjacentRoom direction: direction.
        ]
        ifFalse: [
            communicatesService roomLocked
        ]
    ]

    checkIfPassage: room direction: direction[
        (room == passage)
        ifTrue: [
            hero location: passage.
            passage wasVisited: true.
            self go: direction.
        ]
        ifFalse: [
            hero moveTotheRoom: room.
        ]
    ]
]
