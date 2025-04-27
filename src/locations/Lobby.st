NoneNpcRoom subclass: Lobby [

    initialize [
        super initializeWithName: 'lobby'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new).
            adjacentWest: emptyRoomB
            adjacentSouth: emptyRoomA
            adjacentEast: socialRoom
            adjacentNorth: securityCheckOffices
        itemsList add: money4.
    ]
]
