Item subclass: Money [
    | amount |

    initialize: newLocation 
        amount: newAmount 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'money' 
            location: newLocation
            communicatesService: newCommunicatesService 
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
        location removeItem: self.
        (location itemsList isEmpty)
        ifTrue: [
            location hasItem: false 
        ]
    ]

    description [
        communicatesService moneyDescription: amount.
    ]
]