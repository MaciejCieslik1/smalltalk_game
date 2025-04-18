NpcRoom subclass: #Cafeteria

Cafeteria >> initialize [
    super initialize: 'cafeteria'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new)
    itemsList add: apple_juice
    itemsList add: orange_juice
    itemsList add: multivitamina_juice
        npcList: (OrderedCollection new).
    npcList add: chef.
]
