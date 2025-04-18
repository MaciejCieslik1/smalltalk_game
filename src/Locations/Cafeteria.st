NpcRoom subclass: #Cafeteria

Cafeteria >> initialize [
    super initialize: 'cafeteria'
        isAccessible: true
        hasItem: true
        itemsList: (OrderedCollection new)
    itemsList add: wine
        npcList: (OrderedCollection new).
    npcList add: chef.
]
