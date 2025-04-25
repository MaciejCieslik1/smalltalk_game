Object subclass: #Map

Map >> createMap [
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

Map >> createLevelMap: levelList [
    | levelLayout |
    levelLayout := ''
    levelList do: [:room |
        levelLayout := levelLayout, ^ self isHeroInRoom: room
    ]
]

Map >> isHeroInRoom: room [
    (hero location == room)
    ifTrue: [
        ^ '[X]'
    ]
    ifFalse: [
        ^ self wasRoomVisited: room
    ]    
]

Map wasRoomVisited: room [
    (room wasVisited)
    ifTrue: [
        ^ self roomWasVisited
    ]
    ifFalse: [
        ^ self checkNorthAdjacentRoom: room
    ]
]

Map >> roomWasVisited [
    | roomLayout |
    roomLayout := ''
    roomLayout := roomLayout, drawVisitedRoom
    (room adjacentEast != nullRoom)
    ifTrue: [
        roomLayout := roomLayout, '-'
    ]
    ifFalse: [
        roomLayout := roomLayout, ' '
    ]
    ^ roomLayout
]

Map >> drawVisitedRoom [
    (room hasNpc)
    ifTrue: [
        ^ self drawNpcVisitedRoom
    ]
    ifFalse: [
        ^ self drawNoneNpcVisitedRoom
    ]
]

Map >> drawNpcVisitedRoom [
    (room hasItem)
    ifTrue: [
        ^ '[B]'
    ]
    ifFalse: [
        ^ '[N]'
    ]
]

Map >> drawNoneNpcVisitedRoom [
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

Map >> drawAdjacentRoom [
    (room hasNpc)
    ifTrue: [
        ^ self drawNpcAdjacentRoom
    ]
    ifFalse: [
        ^ self drawNoneNpcAdjacentRoom
    ]
]

Map >> drawNpcAdjacentRoom [
    (room hasItem)
    ifTrue: [
        ^ '(B)'
    ]
    ifFalse: [
        ^ '(N)'
    ]
]

Map >> drawNoneNpcAdjacentRoom [
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

Map >> checkNorthAdjacentRoom: room [
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

Map >> checkWestAdjacentRoomWasVisited :room [
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

Map >> checkSouthAdjacentRoom: room [
    (room adjacentSouth wasVisited)
    ifTrue: [
        roomLayout := roomLayout, self drawAdjacentRoom
    ]
    ifFalse: [
        roomLayout := roomLayout, self checkEastAdjacentRoom
    ]
    ^ roomLayout
]

Map >> checkEastAdjacentRoom: room [
    (room adjacentEast wasVisited)
    ifTrue: [
        roomLayout := roomLayout, '-', self drawAdjacentRoom
    ]
    ifFalse: [
        roomLayout := roomLayout, ' '
    ]  
]

Map >> createVerticalCorridors: levelList [
    | corridorsLayout |
    corridorsLayout := ''
    levelList do: [:room |
        corridorsLayout := corridorsLayout, ^ self hasRoomVerticalCorridor: room
    ]
]

Map >> hasRoomVerticalCorridor: room [
    (room adjacentSouth != nullRoom)
    ifTrue: [
        ^ ' | '
    ]
    ifFalse: [
        ^ '   '
    ]
]
