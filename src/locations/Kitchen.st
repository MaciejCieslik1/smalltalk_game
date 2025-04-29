NpcRoom subclass: Kitchen [

    initialize [
        super initializeWithName: 'kitchen'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]
