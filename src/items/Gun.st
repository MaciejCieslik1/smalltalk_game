Item subclass: Gun [

    initialize: newCommunicatesService 
        inputService: newInputService[
        super initializeWithName: 'gun'
            location: nil
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService gunDescription
    ]
]
