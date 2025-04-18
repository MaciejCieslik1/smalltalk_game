NpcRoom subclass: #SecurityCheckEntry

SecurityCheckEntry >> initialize [
    super initialize: 'security check (entry)'
        isAccessible: true
        hasItem: false
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new)
    npcList add: guard1.
]
