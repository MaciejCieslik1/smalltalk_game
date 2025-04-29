NoneNpcRoom subclass: Cloakroom [

    initialize [
        super initializeWithName: 'cloakroom'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
