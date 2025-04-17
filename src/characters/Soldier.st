Npc subclass: #Soldier
    instanceVariableNames: 'items'

Soldier >> initialize: [
    super initialize 'soldier' private barracks false
    items := #(helmet)
]

Soldier >> items [
    ^ items
]

Soldier >> items: newItems [
    items := newItems
]

Soldier >> addItem: newItem [
    items add: newItem
]

Soldier >> removeItem: item [
    items remove: item
]

Soldier >> hasItem: item [
    ^ self items include: item
]

Soldier >> createInfo [
    | info |
    info := super createInfo,
            'Items: ', (self items joinSeparatedBy: ', '), String cr.
    ^ info
]