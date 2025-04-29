NpcRoom subclass: Cafeteria [

    Cafeteria class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'cafeteria'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]
