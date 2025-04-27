NoneNpcRoom subclass: EmptyRoomA [

    initialize [
        super initializeWithName: 'empty room A'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: cloakroom
            adjacentEast: cafeteria
            adjacentNorth: lobby
    ]
]
