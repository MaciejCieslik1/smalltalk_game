NoneNpcRoom subclass: ConferenceRoom [

    ConferenceRoom class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'conference room'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]