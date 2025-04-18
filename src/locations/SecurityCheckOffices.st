NpcRoom subclass: #SecurityCheckOffices

SecurityCheckOffices >> initialize [
    super initialize: 'security check (offices)'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new)
    npcList add: guard2.
]
