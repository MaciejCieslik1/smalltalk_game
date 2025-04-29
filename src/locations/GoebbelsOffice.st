NoneNpcRoom subclass: GoebbelsOffice [

    GoebbelsOffice class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'goebbels''s office'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]
