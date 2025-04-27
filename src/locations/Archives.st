NoneNpcRoom subclass: Archives [

    initialize [
        super initializeWithName: 'archives'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: securityCheckOffices
            adjacentEast: nullRoom
            adjacentNorth: nullRoom
        itemsList add: lever.
    ]
]
