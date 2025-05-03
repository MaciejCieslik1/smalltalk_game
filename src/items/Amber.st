Item subclass: Amber [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'amber'
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService amberDescription.
    ]
]
