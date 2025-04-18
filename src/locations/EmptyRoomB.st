NpcRoom subclass: #emptyRoomB

emptyRoomB >> initialize [
    super initialize: 'empty room B'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new).
    npcList add: bandit.
]
