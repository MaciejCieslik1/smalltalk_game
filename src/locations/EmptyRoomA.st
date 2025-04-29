NoneNpcRoom subclass: EmptyRoomA [

    EmptyRoomA class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'empty room A'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]
