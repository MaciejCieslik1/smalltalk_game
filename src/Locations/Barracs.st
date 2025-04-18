NpcRoom subclass: #Barracs

Barracs >> initialize [
    super initialize: 'barracs'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new)
    itemsList add: baton
        npcList: (OrderedCollection new).
    npcList add: soldier.
]
