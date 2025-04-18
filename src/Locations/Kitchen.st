NpcRoom subclass: #Kitchen

Kitchen >> initialize [
    super initialize: 'kitchen'
        isAccessible: true
        hasItem: true
        itemsList: (OrderedCollection new)
    itemsList add: money2
        npcList: (OrderedCollection new)
    npcList add: waiter.
]
