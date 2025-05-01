Item subclass: Poison [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'poison'
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService poisonDescription.
    ]
]