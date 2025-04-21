NoneNpcRoom subclass: #EmptyRoomA

EmptyRoomA >> initialize [
    super initialize: 'empty room A'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
        adjacentWest: nullRoom
        adjacentSouth: cloakroom
        adjacentEast: cafeteria
        adjacentNorth: lobby
]
