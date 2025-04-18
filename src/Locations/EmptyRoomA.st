NoneNpcRoom subclass: #EmptyRoomA

EmptyRoomA >> initialize [
    super initialize: 'empty room A'
        isAccessible: true
        hasItem: false
        itemsList: (OrderedCollection new).
]
