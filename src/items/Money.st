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

Money >> pickUp [
    hero addMoney: self amount
    self location removeItem: self
]

Money >> description [
    communicatesService moneyDescription: self amount
]
