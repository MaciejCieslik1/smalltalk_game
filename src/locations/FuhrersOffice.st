NpcRoom subclass: #FuhrersOffice

FuhrersOffice >> initialize [
    super initialize: 'fuhrer''s office'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new)
        adjacentWest: nullRoom
        adjacentSouth: emptyRoomB
        adjacentEast: conferenceRoom
        adjacentNorth: fuhrersQuarters
    npcList add: guard3
    npcList add: guard4
]
