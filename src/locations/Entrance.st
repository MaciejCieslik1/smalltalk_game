NoneNpcRoom subclass: Entrance [

    initialize [
        super initializeWithName: 'entrance'
            isAccessible: true
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
