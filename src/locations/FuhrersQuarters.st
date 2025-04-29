NpcRoom subclass: FuhrersQuarters [

    FuhrersQuarters class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'fuhrer''s quarters'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]