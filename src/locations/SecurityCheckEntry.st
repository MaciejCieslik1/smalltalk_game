NpcRoom subclass: SecurityCheckEntry [

    SecurityCheckEntry class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'security check (entry)'
            isAccessible: true
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]