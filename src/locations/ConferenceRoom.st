NoneNpcRoom subclass: ConferenceRoom [

    initialize [
        super initializeWithName: 'conference room'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
    ]
]