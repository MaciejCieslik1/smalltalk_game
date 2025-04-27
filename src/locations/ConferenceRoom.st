NoneNpcRoom subclass: ConferenceRoom [

    initialize [
        super initializeWithName: 'conference room'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            adjacentWest: fuhrersOffice
            adjacentSouth: nullRoom
            adjacentEast: securityCheckOffices
            adjacentNorth: goebbelsOffice
    ]
]