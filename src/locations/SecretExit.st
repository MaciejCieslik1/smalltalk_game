NoneNpcRoom subclass: #SecretExit [

    initialize [
        super initializeWithName: 'secret exit'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new).
    ]
]
