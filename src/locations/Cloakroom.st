NoneNpcRoom subclass: Cloakroom [

    Cloakroom class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'cloakroom'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
