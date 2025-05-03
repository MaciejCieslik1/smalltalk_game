Object subclass: Map [
    | hero nullRoom passage levelMatrix communicatesService |

    initialize: newHero 
        nullRoom: newNullRoom 
        passage: newPassage 
        levelMatrix: newLevelMatrix 
        communicatesService: newCommunicatesService
    [
        hero := newHero.
        nullRoom := newNullRoom.
        passage := newPassage.
        levelMatrix := newLevelMatrix.
        communicatesService := newCommunicatesService.
    ]

    createMap [
        | levelMap |
        levelMap := ''.
        levelMatrix do: [:row |
            levelMap :=  self createLevelMap: row.
            communicatesService printStringNewLine: levelMap.
            levelMap := self createVerticalCorridors: row.
            communicatesService printStringNewLine: levelMap.
        ].
    ]

    createLevelMap: row [
        | levelLayout symbol |
        levelLayout := ''.
        row do: [:room |
            symbol := self isHeroInRoom: room.
            levelLayout := levelLayout, symbol.
        ].
        ^ levelLayout.
    ]

    isHeroInRoom: room [
        (hero location == room)
        ifTrue: [
            (room adjacentEast ~= nullRoom)
            ifTrue: [
                ^ '[X]-'.
            ]
            ifFalse: [
                ^ '[X]'.
            ].
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
        | roomLayout symbol |
        roomLayout := ''.
        symbol := self drawVisitedRoom: room.
        roomLayout := roomLayout, symbol.
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
        | roomLayout symbol |
        roomLayout := ''.
        (room adjacentNorth wasVisited)
        ifTrue: [
            symbol := self drawAdjacentRoom: room.
            roomLayout := roomLayout, symbol.
        ]
        ifFalse: [
            symbol := self checkWestAdjacentRoom: room.
            roomLayout := roomLayout, symbol.
        ].
        ^ roomLayout
    ]

    checkWestAdjacentRoom: room [
        | roomLayout symbol |
        roomLayout := ''.
        (room adjacentWest wasVisited)
        ifTrue: [
            symbol := self drawAdjacentRoom: room.
            roomLayout := roomLayout, symbol.
        ]
        ifFalse: [
            symbol := self checkSouthAdjacentRoom: room.
            roomLayout := roomLayout, symbol. 
        ].
        ^ roomLayout
    ]

    checkSouthAdjacentRoom: room [
        | roomLayout symbol |
        roomLayout := ''.
        (room adjacentSouth wasVisited)
        ifTrue: [
            symbol := self drawAdjacentRoom: room.
            roomLayout := roomLayout, symbol.
        ]
        ifFalse: [
            symbol := self checkEastAdjacentRoom: room.
            roomLayout := roomLayout, symbol.
        ].
        ^ roomLayout
    ]

    checkEastAdjacentRoom: room [
        | roomLayout symbol |
        roomLayout := ''.
        (room adjacentEast wasVisited)
        ifTrue: [
            symbol := self drawAdjacentRoom: room.
            roomLayout := roomLayout, '-', symbol.
        ]
        ifFalse: [
            roomLayout := roomLayout, '    '.
        ].
        ^ roomLayout.
    ]

    createVerticalCorridors: levelList [
        | corridorsLayout symbol |
        corridorsLayout := ''.
        levelList do: [:room |
            symbol := self hasRoomVerticalCorridor: room.
            corridorsLayout := corridorsLayout, symbol. 
        ].
        ^ corridorsLayout.
    ]

    hasRoomVerticalCorridor: room [
        (room adjacentSouth ~= nullRoom and:[room adjacentSouth wasVisited])
        ifTrue: [
            ^ ' |  '
        ]
        ifFalse: [
            ^ '    '
        ].
    ]
]