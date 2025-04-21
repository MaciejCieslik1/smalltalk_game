NpcRoom subclass: #Barracs

Barracs >> initialize [
    super initialize: 'barracs'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new).
        adjacentWest: nullRoom
        adjacentSouth: socialRoom
        adjacentEast: nullRoom
        adjacentNorth: nullRoom
    itemsList add: baton
    npcList add: soldier.
]
