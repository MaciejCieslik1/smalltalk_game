NoneNpcRoom subclass: #KitchenExit

KitchenExit >> initialize [
    super initialize: 'kitchen exit'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
        adjacentWest: foodStorage
        adjacentSouth: nullRoom
        adjacentEast: nullRoom
        adjacentNorth: nullRoom
]
