NpcRoom subclass: EmptyRoomB [

    initialize [
        super initializeWithName: 'empty room B'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]