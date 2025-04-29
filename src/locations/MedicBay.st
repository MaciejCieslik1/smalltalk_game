NoneNpcRoom subclass: MedicBay [

    initialize [
        super initializeWithName: 'medic bay'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
