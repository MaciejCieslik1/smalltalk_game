NoneNpcRoom subclass: #Cloakroom

Cloakroom >> initialize [
    super initialize: 'cloakroom'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: umbrella.
]
