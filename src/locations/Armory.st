NpcRoom subclass: Armory [

    initialize [
        super initializeWithName: 'armory'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]