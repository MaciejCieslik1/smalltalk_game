Item subclass: Money [
    | amount |

    Money class >> newInitialize: location amount: newAmount[
        ^ super new initialize: location amount: newAmount.
    ]

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

    pickUp: hero [
        hero addMoney: self amount.
        self location removeItem: self.
    ]

    description [
        communicatesService moneyDescription: self amount.
    ]
]