Object subclass: Map [
    | communicatesService nullRoom passage |

    initialize: newCommunicatesService room: newNullRoom passage: newPassage[
        communicatesService := newCommunicatesService.
        nullRoom := newNullRoom.
        passage := newPassage.
    ]

    createMap: roomsRowsMatrix [
        | level map |

        roomsRowsMatrix do: [:row |
            map := map, String cr, self createLevelMap: row.
            map := map, String cr, self createVerticalCorridors: row.
        ].

        communicatesService printStringNewLine: map
    ]

    createLevelMap: levelList [
        | levelLayout |
        levelLayout := ''
        levelList do: [:room |
            levelLayout := levelLayout, self isHeroInRoom: room.
        ].
    ]

    isHeroInRoom: hero currentRoom: room [
        (hero location == room)
        ifTrue: [
            ^ '[X]'
        ]
        ifFalse: [
            ^ self wasRoomVisited: room.
        ].    
    ]

    wasRoomVisited: room [
        (room wasVisited)
        ifTrue: [
            ^ self roomWasVisited: room.
        ]
        ifFalse: [
            ^ self checkNorthAdjacentRoom: room.
        ].
    ]

    roomWasVisited: room [
        | roomLayout |
        roomLayout := ''.
        roomLayout := roomLayout, self drawVisitedRoom: room.
        (room adjacentEast ~= nullRoom)
        ifTrue: [
            roomLayout := roomLayout, '-'
        ]
        ifFalse: [
            roomLayout := roomLayout, ' '
        ].
        ^ roomLayout
    ]

    drawVisitedRoom: room [
        (room hasNpc)
        ifTrue: [
            ^ self drawNpcVisitedRoom: room.
        ]
        ifFalse: [
            ^ self drawNoneNpcVisitedRoom: room.
        ].
    ]

    drawNpcVisitedRoom: room [
        (room hasItem)
        ifTrue: [
            ^ '[B]'
        ]
        ifFalse: [
            ^ '[N]'
        ].
    ]

    drawNoneNpcVisitedRoom: room [
        (room == passage)
        ifTrue: [
            ^ '==='
        ].
        (room hasItem)
        ifTrue: [
            ^ '[I]'
        ]
        ifFalse: [
            ^ '[ ]'
        ].
    ]

    drawAdjacentRoom: room [
        (room hasNpc)
        ifTrue: [
            ^ self drawNpcAdjacentRoom: room.
        ]
        ifFalse: [
            ^ self drawNoneNpcAdjacentRoom: room.
        ].
    ]

    drawNpcAdjacentRoom: room [
        (room hasItem)
        ifTrue: [
            ^ '(B)'
        ]
        ifFalse: [
            ^ '(N)'
        ].
    ]

    drawNoneNpcAdjacentRoom: room [
        (room == passage)
        ifTrue: [
            ^ '==='
        ].
        (room hasItem)
        ifTrue: [
            ^ '(I)'
        ]
        ifFalse: [
            ^ '( )'
        ].
    ]

    checkNorthAdjacentRoom: room [
        | roomLayout |
        roomLayout := ''.
        (room adjacentNorth wasVisited)
        ifTrue: [
            roomLayout := roomLayout, self drawAdjacentRoom.
        ]
        ifFalse: [
            roomLayout := roomLayout, self checkWestAdjacentRoom.
        ].
        ^ roomLayout
    ]

    checkWestAdjacentRoomWasVisited: room [
        | roomLayout |
        (room adjacentWest wasVisited)
        ifTrue: [
            roomLayout := roomLayout, self drawAdjacentRoom.
        ]
        ifFalse: [
            roomLayout := roomLayout, self checkSouthAdjacentRoom.
        ].
        ^ roomLayout
    ]

    checkSouthAdjacentRoom: room [
        | roomLayout |
        (room adjacentSouth wasVisited)
        ifTrue: [
            roomLayout := roomLayout, self drawAdjacentRoom.
        ]
        ifFalse: [
            roomLayout := roomLayout, self checkEastAdjacentRoom.
        ].
        ^ roomLayout
    ]

    checkEastAdjacentRoom: room [
        | roomLayout |
        (room adjacentEast wasVisited)
        ifTrue: [
            roomLayout := roomLayout, '-', self drawAdjacentRoom.
        ]
        ifFalse: [
            roomLayout := roomLayout, ' '
        ].
    ]

    createVerticalCorridors: levelList [
        | corridorsLayout |
        corridorsLayout := ''
        levelList do: [:room |
            corridorsLayout := corridorsLayout, self hasRoomVerticalCorridor: room.
        ].
    ]

    hasRoomVerticalCorridor: room [
        (room adjacentSouth ~= nullRoom)
        ifTrue: [
            ^ ' | '
        ]
        ifFalse: [
            ^ '   '
        ].
    ]
]