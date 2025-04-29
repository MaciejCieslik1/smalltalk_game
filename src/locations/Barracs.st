NpcRoom subclass: Barracs [

    Barracs class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'barracs'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]