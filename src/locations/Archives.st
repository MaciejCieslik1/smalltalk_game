NoneNpcRoom subclass: Archives [

    Archives class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'archives'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
