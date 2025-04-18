NpcRoom subclass: #Armory

Armory >> initialize [
    super initialize: 'armory'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new)
        npcList: (OrderedCollection new)
    npcList add: salesman.
]
