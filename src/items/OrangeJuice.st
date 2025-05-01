Juice subclass: OrangeJuice [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'orange_juice'
            location: newLocation
            isPoisoned: false
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService orangeJuiceDescription.
    ]
]
