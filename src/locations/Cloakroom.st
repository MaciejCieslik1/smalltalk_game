NoneNpcRoom subclass: Cloakroom [

    Cloakroom >> initialize [
        super initializeWithName: 'cloakroom'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: securityCheckEntry
            adjacentEast: nullRoom
            adjacentNorth: emptyRoomA
        itemsList add: umbrella.
    ]
]
