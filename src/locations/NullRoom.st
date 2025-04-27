NoneNpcRoom subclass: NullRoom [

    initialize [
        super initializeWithName: 'null room'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            adjacentWest: nil
            adjacentSouth: nil
            adjacentEast: nil
            adjacentNorth: nil
    ]
]
