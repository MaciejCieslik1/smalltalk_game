NpcRoom subclass: EmptyRoomB [

    EmptyRoomB >> initialize [
        super initializeWithName: 'empty room B'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: nullRoom
            adjacentEast: lobby
            adjacentNorth: fuhrersOffice
        npcList add: bandit.
    ]
]