NpcRoom subclass: Barracs [

    initialize [
        super initializeWithName: 'barracs'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]