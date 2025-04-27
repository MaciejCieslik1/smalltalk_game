Object subclass: Map [

    createMap [
        | firstLevelRoomsList secondLevelRoomsList thirdLevelRoomsList fourthLevelRoomsList fifthLevelRoomsList sixthLevelRoomsList map |
        sixthLevelRoomsList := #(secretExit, fuhrersQuarters, goebbelsOffice, archives, nullRoom, nullRoom, nullRoom)
        fifthLevelRoomsList := #(nullRoom, fuhrersOffice, conferenceRoom, securityCheckOffices, barracks, nullRoom, nullRoom)
        fourthLevelRoomsList := #(nullRoom, emptyRoomB, passage, lobby, socialRoom, foodStorage, kitchenExit)
        thirdLevelRoomsList := #(nullRoom, nullRoom, nullRoom, emptyRoomA, cafeteria, kitchen, nullRoom)
        secondLevelRoomsList := #(nullRoom, nullRoom, nullRoom, cloaroom, medicBay, nullRoom, nullRoom)
        firstLevelRoomsList := #(nullRoom, nullRoom, entrance, securityCheckEntry, armory, nullRoom, nullRoom)

        map := map, cr, createLevelMap: sixthLevelRoomsList
        map := map, cr, createVerticalCorridors: sixthLevelRoomsList
        map := map, cr, createLevelMap: fifthLevelRoomsList
        map := map, cr, createVerticalCorridors: fifthLevelRoomsList
        map := map, cr, createLevelMap: fourthLevelRoomsList
        map := map, cr, createVerticalCorridors: fourthLevelRoomsList
        map := map, cr, createLevelMap: thirdLevelRoomsList
        map := map, cr, createVerticalCorridors: thirdLevelRoomsList
        map := map, cr, createLevelMap: secondLevelRoomsList
        map := map, cr, createVerticalCorridors: secondLevelRoomsList
        map := map, cr, createLevelMap: firstLevelRoomsList

        communicateService printStringNewLine: map
    ]

    createLevelMap: levelList [
        | levelLayout |
        levelLayout := ''
        levelList do: [:room |
            levelLayout := levelLayout, ^ self isHeroInRoom: room
        ]
    ]

    isHeroInRoom: room [
        (hero location == room)
        ifTrue: [
            ^ '[X]'
        ]
        ifFalse: [
            ^ self wasRoomVisited: room
        ]    
    ]

    wasRoomVisited: room [
        (room wasVisited)
        ifTrue: [
            ^ self roomWasVisited
        ]
        ifFalse: [
            ^ self checkNorthAdjacentRoom: room
        ]
    ]

    roomWasVisited [
        | roomLayout |
        roomLayout := ''
        roomLayout := roomLayout, drawVisitedRoom
        (room adjacentEast ~= nullRoom)
        ifTrue: [
            roomLayout := roomLayout, '-'
        ]
        ifFalse: [
            roomLayout := roomLayout, ' '
        ].
        ^ roomLayout
    ]

    drawVisitedRoom [
        (room hasNpc)
        ifTrue: [
            ^ self drawNpcVisitedRoom
        ]
        ifFalse: [
            ^ self drawNoneNpcVisitedRoom
        ]
    ]

    drawNpcVisitedRoom [
        (room hasItem)
        ifTrue: [
            ^ '[B]'
        ]
        ifFalse: [
            ^ '[N]'
        ]
    ]

    drawNoneNpcVisitedRoom [
        (room == passage)
        ifTrue: [
            ^ '==='
        ]
        (room hasItem)
        ifTrue: [
            ^ '[I]'
        ]
        ifFalse: [
            ^ '[ ]'
        ]
    ]

    drawAdjacentRoom [
        (room hasNpc)
        ifTrue: [
            ^ self drawNpcAdjacentRoom
        ]
        ifFalse: [
            ^ self drawNoneNpcAdjacentRoom
        ]
    ]

    drawNpcAdjacentRoom [
        (room hasItem)
        ifTrue: [
            ^ '(B)'
        ]
        ifFalse: [
            ^ '(N)'
        ]
    ]

    drawNoneNpcAdjacentRoom [
        (room == passage)
        ifTrue: [
            ^ '==='
        ]
        (room hasItem)
        ifTrue: [
            ^ '(I)'
        ]
        ifFalse: [
            ^ '( )'
        ]
    ]

    checkNorthAdjacentRoom: room [
        | roomLayout |
        roomLayout := ''
        (room adjacentNorth wasVisited)
        ifTrue: [
            roomLayout := roomLayout, self drawAdjacentRoom
        ]
        ifFalse: [
            roomLayout := roomLayout, self checkWestAdjacentRoom
        ]
        ^ roomLayout
    ]

    checkWestAdjacentRoomWasVisited :room [
        | roomLayout |
        (room adjacentWest wasVisited)
        ifTrue: [
            roomLayout := roomLayout, self drawAdjacentRoom
        ]
        ifFalse: [
            roomLayout := roomLayout, self checkSouthAdjacentRoom
        ]
        ^ roomLayout
    ]

    checkSouthAdjacentRoom: room [
        (room adjacentSouth wasVisited)
        ifTrue: [
            roomLayout := roomLayout, self drawAdjacentRoom
        ]
        ifFalse: [
            roomLayout := roomLayout, self checkEastAdjacentRoom
        ]
        ^ roomLayout
    ]

    checkEastAdjacentRoom: room [
        (room adjacentEast wasVisited)
        ifTrue: [
            roomLayout := roomLayout, '-', self drawAdjacentRoom
        ]
        ifFalse: [
            roomLayout := roomLayout, ' '
        ]  
    ]

    createVerticalCorridors: levelList [
        | corridorsLayout |
        corridorsLayout := ''
        levelList do: [:room |
            corridorsLayout := corridorsLayout, ^ self hasRoomVerticalCorridor: room
        ]
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