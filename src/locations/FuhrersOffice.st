NpcRoom subclass: FuhrersOffice [

    FuhrersOffice class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'fuhrer''s office'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]