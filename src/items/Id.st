Item subclass: Id [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'id'
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService idDescription.
    ]
]
