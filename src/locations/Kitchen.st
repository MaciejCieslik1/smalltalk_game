NpcRoom subclass: Kitchen [

    Kitchen class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'kitchen'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]
