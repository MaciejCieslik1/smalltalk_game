NoneNpcRoom subclass: Entrance [

    initialize [
        super initializeWithName: 'entrance'
            isAccessible: true
            hasItem: true
            itemsList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: nullRoom
            adjacentEast: securityCheckEntry
            adjacentNorth: nullRoom
        itemsList add: id.
    ]
]
