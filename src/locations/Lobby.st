NoneNpcRoom subclass: Lobby [

    initialize [
        super initializeWithName: 'lobby'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
    ]
]
