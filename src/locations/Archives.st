NoneNpcRoom subclass: Archives [

    initialize [
        super initializeWithName: 'archives'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
