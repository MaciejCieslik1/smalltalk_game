NpcRoom subclass: Kitchen [

    initialize [
        super initializeWithName: 'kitchen'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
            adjacentWest: cafeteria
            adjacentSouth: nullRoom
            adjacentEast: nullRoom
            adjacentNorth: foodStorage
        itemsList add: money2
        npcList add: waiter.
    ]
]
