NpcRoom subclass: SecurityCheckOffices [

    initialize [
        super initializeWithName: 'security check (offices)'
            isAccessible: false
            hasItem: false
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new)
    ]
]