NpcRoom subclass: #Kitchen

Kitchen >> initialize [
    super initialize: 'kitchen'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new)
    itemsList add: money2
        npcList: (OrderedCollection new)
    npcList add: waiter.
]
