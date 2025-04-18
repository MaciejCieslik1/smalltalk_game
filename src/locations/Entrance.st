NoneNpcRoom subclass: #Entrance

Entrance >> initialize [
    super initialize: 'entrance'
        isAccessible: true
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: id.
]
