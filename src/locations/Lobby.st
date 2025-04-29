NoneNpcRoom subclass: Lobby [

    Lobby class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'lobby'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
