Object subclass: Map [

    createMap [
        | firstLevelRoomsList secondLevelRoomsList thirdLevelRoomsList fourthLevelRoomsList fifthLevelRoomsList sixthLevelRoomsList map |
        sixthLevelRoomsList := Array with: secretExit with: fuhrersQuarters with: goebbelsOffice with: archives with: nullRoom 
                                with: nullRoom with: nullRoom.
        fifthLevelRoomsList := Array with: nullRoom with: fuhrersOffice with: conferenceRoom with: securityCheckOffices with: barracks 
                                with: nullRoom with: nullRoom.
        fourthLevelRoomsList := Array with: nullRoom with: emptyRoomB with: passage with: lobby with: socialRoom with: foodStorage
                                with: kitchenExit.
        thirdLevelRoomsList := Array with: nullRoom with: nullRoom with: nullRoom with: emptyRoomA with: cafeteria with: kitchen 
                                with: nullRoom.
        secondLevelRoomsList := Array with: nullRoom with: nullRoom with: nullRoom with: cloaroom with: medicBay with: nullRoom 
                                with: nullRoom.
        firstLevelRoomsList := Array with: nullRoom with: nullRoom with: entrance with: securityCheckEntry with: armory with: nullRoom 
                                with: nullRoom.

        map := map, cr, self createLevelMap: sixthLevelRoomsList.
        map := map, cr, self createVerticalCorridors: sixthLevelRoomsList.
        map := map, cr, self createLevelMap: fifthLevelRoomsList.
        map := map, cr, self createVerticalCorridors: fifthLevelRoomsList.
        map := map, cr, self createLevelMap: fourthLevelRoomsList.
        map := map, cr, self createVerticalCorridors: fourthLevelRoomsList.
        map := map, cr, self createLevelMap: thirdLevelRoomsList.
        map := map, cr, self createVerticalCorridors: thirdLevelRoomsList.
        map := map, cr, self createLevelMap: secondLevelRoomsList.
        map := map, cr, self createVerticalCorridors: secondLevelRoomsList.
        map := map, cr, self createLevelMap: firstLevelRoomsList.

        communicateService printStringNewLine: map
    ]

    createLevelMap: levelList [
        | levelLayout |
        levelLayout := ''
        levelList do: [:room |
            levelLayout := levelLayout, self isHeroInRoom: room.
        ].
    ]

    isHeroInRoom: room [
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
            ^ self roomWasVisited.
        ]
        ifFalse: [
            ^ self checkNorthAdjacentRoom: room.
        ].
    ]

    roomWasVisited [
        | roomLayout |
        roomLayout := ''.
        roomLayout := roomLayout, drawVisitedRoom.
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
            ^ self drawNpcVisitedRoom.
        ]
        ifFalse: [
            ^ self drawNoneNpcVisitedRoom.
        ].
    ]

    drawNpcVisitedRoom [
        (room hasItem)
        ifTrue: [
            ^ '[B]'
        ]
        ifFalse: [
            ^ '[N]'
        ].
    ]

    drawNoneNpcVisitedRoom [
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

    drawAdjacentRoom [
        (room hasNpc)
        ifTrue: [
            ^ self drawNpcAdjacentRoom.
        ]
        ifFalse: [
            ^ self drawNoneNpcAdjacentRoom.
        ].
    ]

    drawNpcAdjacentRoom [
        (room hasItem)
        ifTrue: [
            ^ '(B)'
        ]
        ifFalse: [
            ^ '(N)'
        ].
    ]

    drawNoneNpcAdjacentRoom [
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