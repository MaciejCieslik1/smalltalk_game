NoneNpcRoom subclass: FoodStorage [

    initialize [
        super initializeWithName: 'food storage'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
