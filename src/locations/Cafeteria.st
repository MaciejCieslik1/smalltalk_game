NpcRoom subclass: Cafeteria [

    initialize [
        super initializeWithName: 'cafeteria'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]
