NoneNpcRoom subclass: #Cloakroom

Cloakroom >> initialize [
    super initialize: 'cloakroom'
        isAccessible: true
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: umbrella.
]
