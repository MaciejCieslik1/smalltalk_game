NoneNpcRoom subclass: KitchenExit [

    initialize [
        super initializeWithName: 'kitchen exit'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new).
            adjacentWest: foodStorage
            adjacentSouth: nullRoom
            adjacentEast: nullRoom
            adjacentNorth: nullRoom
    ]
]
