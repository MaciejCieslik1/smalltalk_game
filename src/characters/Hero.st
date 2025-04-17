Character subclass: #Hero
    instanceVariableNames: 'items uniform money'

Hero >> initialize: [
    super initialize 'Johannes Golmer' startExit true
    items := OrderedCollection new
    uniform := military_uniform
    money := 0
]

Hero >> items [
    ^ items
]

Hero >> items: newItems [
    items := newItems
]

Hero >> addItem: newItem [
    items add: newItem
]

Hero >> removeItem: item [
    items remove: item
]

Hero >> uniform [
    ^ uniform
]

Hero >> uniform: newUniform [
    uniform := newUniform
]

Hero >> money [
    ^ money
]

Hero >> money: newMoney [
    newMoney < 0 ifTrue: [
        Error new signal: 'Money cannot be less than 0'.
    ].
    money := newMoney.
]