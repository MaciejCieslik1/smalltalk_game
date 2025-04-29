NoneNpcRoom subclass: Entrance [

    Entrance class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'entrance'
            isAccessible: true
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
