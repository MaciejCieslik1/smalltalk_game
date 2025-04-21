Room subclass: #NullRoom

SecretExit >> initialize [
    super initialize: 'null room'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
        adjacentWest: false
        adjacentSouth: false
        adjacentEast: false
        adjacentNorth: false
]
