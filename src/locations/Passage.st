NoneNpcRoom subclass: Passage [

    Passage class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'passage'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]