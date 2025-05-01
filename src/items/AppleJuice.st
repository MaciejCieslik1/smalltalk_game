Juice subclass: AppleJuice [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'apple_juice'
            location: newLocation
            isPoisoned: false
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService appleJuiceDescription.
    ]
]