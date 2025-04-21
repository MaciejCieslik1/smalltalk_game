NpcRoom subclass: #Armory

Armory >> initialize [
    super initialize: 'armory'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new)
        adjacentWest: securityCheckEntry
        adjacentSouth: nullRoom
        adjacentEast: nullRoom
        adjacentNorth: nullRoom
    npcList add: salesman.
]
