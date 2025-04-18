NoneNpcRoom subclass: #Lobby

Lobby >> initialize [
    super initialize: 'lobby'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: money4.
]
