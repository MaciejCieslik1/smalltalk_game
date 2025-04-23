Item subclass: #Money
    instanceVariableNames: 'amount'

Money >> initialize: newName newLocation newAmount [
    super initialize: newName newLocation
    amount := newAmount
]

Money >> amount [
    ^ amount
]

Money >> amount: newAmount [
    amount := newAmount
]
