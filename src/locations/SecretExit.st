NoneNpcRoom subclass: SecretExit [

    initialize: nullRoom [
        super initializeWithName: 'secret exit'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]
