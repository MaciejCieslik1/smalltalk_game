Item subclass: RedKey [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'red_key'
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService redKeyDescription.
    ]
]
