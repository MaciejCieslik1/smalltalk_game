NoneNpcRoom subclass: #Passage

SecretExit >> initialize [
    super initialize: 'passage'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
        adjacentWest: emptyRoomB
        adjacentSouth: false
        adjacentEast: lobby
        adjacentNorth: false
]
