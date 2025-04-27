NpcRoom subclass: FuhrersOffice [

    initialize [
        super initializeWithName: 'fuhrer''s office'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
            adjacentWest: secretExit
            adjacentSouth: fuhrersOffice
            adjacentEast: nullRoom
            adjacentNorth: nullRoom
        npcList add: adolf
    ]
]