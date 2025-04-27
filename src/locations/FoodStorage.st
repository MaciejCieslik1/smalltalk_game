NoneNpcRoom subclass: FoodStorage [

    initialize [
        super initializeWithName: 'food storage'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: kitchen
            adjacentEast: kitchenExit
            adjacentNorth: nullRoom
        itemsList add: poison.
    ]
]
