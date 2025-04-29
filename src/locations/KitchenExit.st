NoneNpcRoom subclass: KitchenExit [
    
    KitchenExit class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'kitchen exit'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]
