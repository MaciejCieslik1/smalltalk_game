NpcRoom subclass: EmptyRoomB [

    EmptyRoomB class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'empty room B'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]