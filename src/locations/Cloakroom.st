NoneNpcRoom subclass: #Cloakroom

Cloakroom >> initialize [
    super initialize: 'cloakroom'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new).
        adjacentWest: nullRoom
        adjacentSouth: securityCheckEntry
        adjacentEast: nullRoom
        adjacentNorth: emptyRoomA
    itemsList add: umbrella.
]
