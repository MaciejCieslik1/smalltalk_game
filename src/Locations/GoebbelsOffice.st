NoneNpcRoom subclass: #GoebbelsOffice

GoebbelsOffice >> initialize [
    super initialize: 'goebbels''s office'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
    itemsList add: amber
    itemsList add. redKey.
]
