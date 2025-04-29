Object subclass: Movement [
    | communicatesService nullRoom passage |

    Movement class >> newInitialize: communicatesService nullRoom: newNullRoom passage: newPassage [
        ^ super new initialize: communicatesService nullRoom: newNullRoom passage: newPassage.
    ]

    initialize: newCommunicatesService nullRoom: newNullRoom passage: newPassage[
        communicatesService := newCommunicatesService.
        nullRoom := newNullRoom.
        passage := newPassage.
    ]

    go: hero direction: direction [
        (direction = 'n')
        ifTrue: [
            self goNorth: hero
        ].
        (direction = 'w')
        ifTrue: [
            self goWest: hero
        ].
        (direction = 's')
        ifTrue: [
            self goSouth: hero
        ].
        (direction = 'e')
        ifTrue: [
            self goEast: hero
        ].
    ]

    goNorth: hero [
        | adjacentRoom |
        adjacentRoom := hero location adjacentNorth.
        self checkAdjacentRoom: adjacentRoom direction: 'n'.
    ]

    goWest: hero [
        | adjacentRoom |
        adjacentRoom := hero location adjacentWest.
        self checkAdjacentRoom: adjacentRoom direction: 'w'.
    ]

    goSouth: hero [
        | adjacentRoom |
        adjacentRoom := hero location adjacentSouth.
        self checkAdjacentRoom: adjacentRoom direction: 's'.
    ]

    goEast: hero [
        | adjacentRoom |
        adjacentRoom := hero location adjacentEast.
        self checkAdjacentRoom: hero room: adjacentRoom direction: 'e'.
    ]

    checkAdjacentRoom: hero room: adjacentRoom direction: direction [
        (adjacentRoom ~= nullRoom)
        ifTrue: [
            self checkIfAccessible: hero room: adjacentRoom direction: direction.
        ]
        ifFalse: [
            communicatesService noRoom
        ]
    ]

    checkIfAccessible: hero room: adjacentRoom direction: direction[
        (adjacentRoom isAccessible = true)
        ifTrue: [
            self checkIfPassage: hero room: adjacentRoom direction: direction.
        ]
        ifFalse: [
            communicatesService roomLocked
        ]
    ]

    checkIfPassage: hero room: room direction: direction[
        (room == passage)
        ifTrue: [
            hero location: passage.
            passage wasVisited: true.
            self go: hero direction: direction.
        ]
        ifFalse: [
            hero moveTotheRoom: room.
        ]
    ]
]
