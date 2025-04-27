NoneNpcRoom subclass: SocialRoom [

    initialize [
        super initializeWithName: 'social room'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
        itemsList add: money3.
    ]
]
