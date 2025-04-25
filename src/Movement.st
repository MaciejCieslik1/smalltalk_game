Object subclass: #Movement

Movement >> go: direction [
    (direction = 'n')
    ifTrue: [
        self goNorth
    ]
    (direction = 'w')
    ifTrue: [
        self goWest
    ]
    (direction = 's')
    ifTrue: [
        self goSouth
    ]
    (direction = 'e')
    ifTrue: [
        self goEast
    ]
]

Movement >> goNorth [
    | adjacentRoom |
    adjacentRoom := hero location adjacentNorth
    self checkAdjacentRoom: adjacentRoom 'n'
]

Movement >> goWest [
    | adjacentRoom |
    adjacentRoom := hero location adjacentWest
    self checkAdjacentRoom: adjacentRoom 'w'
]

Movement >> goSouth [
    | adjacentRoom |
    adjacentRoom := hero location adjacentSouth
    self checkAdjacentRoom: adjacentRoom 's'
]

Movement >> goEast [
    | adjacentRoom |
    adjacentRoom := hero location adjacentEast
    self checkAdjacentRoom: adjacentRoom 'e'
]

Movement >> checkAdjacentRoom: adjacentRoom [
    (adjacentRoom != nullRoom)
    ifTrue: [
        self checkIfAccessible: adjacentRoom
    ]
    ifFalse: [
        communicatesService noRoom
    ]
]

Movement >> checkIfAccessible: adjacentRoom direction[
    (adjacentRoom isAccessible = true)
    ifTrue: [
        self checkIfPassage
    ]
    ifFalse: [
        communicatesService roomLocked
    ]
]

Movement >> checkIfPassage: room [
    (room == passage)
    ifTrue: [
        hero location: passage
        passage wasVisited: true
        self go: direction
    ]
    ifFalse: [
        hero moveTotheRoom: room
    ]
]
