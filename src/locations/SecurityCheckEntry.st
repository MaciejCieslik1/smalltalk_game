NpcRoom subclass: SecurityCheckEntry [

    initialize [
        super initializeWithName: 'security check (entry)'
            isAccessible: true
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
        npcList add: guard1.
    ]
]