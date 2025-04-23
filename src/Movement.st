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
    self checkAdjacentRoom: adjacentRoom
]

Movement >> goWest [
    | adjacentRoom |
    adjacentRoom := hero location adjacentWest
    self checkAdjacentRoom: adjacentRoom
]

Movement >> goSouth [
    | adjacentRoom |
    adjacentRoom := hero location adjacentSouth
    self checkAdjacentRoom: adjacentRoom
]

Movement >> goEast [
    | adjacentRoom |
    adjacentRoom := hero location adjacentEast
    self checkAdjacentRoom: adjacentRoom
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

Movement >> checkIfAccessible: adjacentRoom [
    (adjacentRoom isAccessible = true)
    ifTrue: [
        hero moveToheRoom: adjacentRoom
    ]
    ifFalse: [
        communicatesService roomLocked
    ]
]
