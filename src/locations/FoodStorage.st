NoneNpcRoom subclass: #FoodStorage

FoodStorage >> initialize [
    super initialize: 'food storage'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: poison.
]
