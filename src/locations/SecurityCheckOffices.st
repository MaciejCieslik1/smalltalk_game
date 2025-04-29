NpcRoom subclass: SecurityCheckOffices [

    SecurityCheckOffices class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'security check (offices)'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]