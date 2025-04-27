Item subclass: Money [
    | amount |

    initializeWithName: newName location: newLocation amount: newAmount [
        super initializeWithName: newName location: newLocation.
        amount := newAmount.
    ]

    amount [
        ^ amount
    ]

    amount: newAmount [
        amount := newAmount.
    ]

    pickUp [
        hero addMoney: self amount.
        self location removeItem: self.
    ]

    description [
        communicatesService moneyDescription: self amount.
    ]
]