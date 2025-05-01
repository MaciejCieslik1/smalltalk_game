Item subclass: Money [
    | amount |

    initialize: newLocation 
        amount: newAmount 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'money' 
            location: newLocation
            communicatesService: communicatesService 
            inputService: inputService.
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