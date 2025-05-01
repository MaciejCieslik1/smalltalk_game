Item subclass: Bandage [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'bandage'
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService bandageDescription.
    ]
]