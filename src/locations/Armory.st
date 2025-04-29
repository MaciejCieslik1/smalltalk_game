NpcRoom subclass: Armory [

    Armory class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'armory'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]