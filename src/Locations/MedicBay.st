NoneNpcRoom subclass: #MedicBay

MedicBay >> initialize [
    super initialize: 'medic bay'
        isAccessible: true
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: bandage
    itemsList add: vitamins.
    itemsList add: chloroform
    itemsList add: money1.
]
