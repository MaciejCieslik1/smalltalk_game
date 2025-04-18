NoneNpcRoom subclass: #Archives

Archives >> initialize [
    super initialize: 'archives'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: lever.
]
