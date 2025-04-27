NoneNpcRoom subclass: GoebbelsOffice [

    initialize [
        super initializeWithName: 'goebbels''s office'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new).
            adjacentWest: nullRoom
            adjacentSouth: conferenceRoom
            adjacentEast: nullRoom
            adjacentNorth: nullRoom
        itemsList add: amber
        itemsList add: redKey.
    ]
]
