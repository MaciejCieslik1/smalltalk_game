NoneNpcRoom subclass: Passage [

    initialize [
        super initializeWithName: 'passage'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]