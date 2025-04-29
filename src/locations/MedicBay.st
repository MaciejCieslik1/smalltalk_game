NoneNpcRoom subclass: MedicBay [

    MedicBay class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'medic bay'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
