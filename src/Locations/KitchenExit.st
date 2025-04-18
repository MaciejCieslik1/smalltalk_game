NoneNpcRoom subclass: #KitchenExit

KitchenExit >> initialize [
    super initialize: 'kitchen exit'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
]
