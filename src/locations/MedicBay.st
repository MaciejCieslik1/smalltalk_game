NoneNpcRoom subclass: MedicBay [

    initialize [
        super initializeWithName: 'medic bay'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: nullRoom
            adjacentEast: nullRoom
            adjacentNorth: cafeteria
        itemsList add: bandage
        itemsList add: vitamins.
        itemsList add: chloroform
        itemsList add: money1.
    ]
]
