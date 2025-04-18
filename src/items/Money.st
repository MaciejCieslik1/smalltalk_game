Item subclass: #Money
    instanceVariableNames: 'amount'

Money >> initialize: newName newAmount [
    super initialize: newName
    amount := newAmount
]

Money >> amount [
    ^ amount
]

Money >> amount: newAmount [
    amount := newAmount
]
