NoneNpcRoom subclass: SecretExit [

    SecretExit class >> newInitialize [
        ^ super new initialize.
    ]

    initialize: nullRoom [
        super initializeWithName: 'secret exit'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]
