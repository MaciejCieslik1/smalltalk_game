Npc subclass: #Salesman
    instanceVariableNames: 'items money'

Salesman >> initialize: [
    super initialize 'salesman' private armory false
    items := #(bulletproofVest, gun)
    money := 10000
]

Salesman >> items [
    ^ items
]

Salesman >> items: newItems [
    items := newItems
]

Salesman >> addItem: newItem [
    items add: newItem
]

Salesman >> removeItem: item [
    items remove: item
]

Salesman >> money [
    ^ money
]

Salesman >> money: newMoney [
    newMoney < 0 ifTrue: [
        Error new signal: 'Money cannot be less than 0'.
    ].
    money := newMoney.
]

Salesman >> createInfo [
    | info |
    info := super createInfo,
            'Money: ', self money, String cr,
            'Items: ', (self items joinSeparatedBy: ', '), String cr.
    ^ info
]