NpcRoom subclass: #FuhrersOffice

FuhrersOffice >> initialize [
    super initialize: 'fuhrer''s office'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new)
    npcList add: guard3
    npcList add: guard4
]
