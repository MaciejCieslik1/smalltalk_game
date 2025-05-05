Item subclass: Juice [
    | isPoisoned |

    initializeWithName: newName 
        location: newLocation 
        isPoisoned: newIsPoisoned 
        communicatesService: newCommunicatesService 
        inputService: newInputService 
    [
        super initializeWithName: newName 
            location: newLocation 
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        isPoisoned := newIsPoisoned.
    ]

    isPoisoned [
        ^ isPoisoned
    ]

    isPoisoned: newIsPoisoned [
        isPoisoned := newIsPoisoned
    ]

    addPoison [
        self name: ('poisoned ', self name) asString.
        self isPoisoned: true
    ]
]