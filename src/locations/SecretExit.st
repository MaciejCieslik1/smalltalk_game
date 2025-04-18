NoneNpcRoom subclass: #SecretExit

SecretExit >> initialize [
    super initialize: 'secret exit'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
]
