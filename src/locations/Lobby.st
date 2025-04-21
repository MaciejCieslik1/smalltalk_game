NoneNpcRoom subclass: #Lobby

Lobby >> initialize [
    super initialize: 'lobby'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new).
        adjacentWest: emptyRoomB
        adjacentSouth: emptyRoomA
        adjacentEast: socialRoom
        adjacentNorth: securityCheckOffices
    itemsList add: money4.
]
