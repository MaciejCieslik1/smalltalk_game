NoneNpcRoom subclass: FoodStorage [

    FoodStorage class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'food storage'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
