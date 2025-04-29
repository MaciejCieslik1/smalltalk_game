NoneNpcRoom subclass: GoebbelsOffice [

    initialize [
        super initializeWithName: 'goebbels''s office'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]
