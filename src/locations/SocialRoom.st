NoneNpcRoom subclass: SocialRoom [

    SocialRoom class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'social room'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
