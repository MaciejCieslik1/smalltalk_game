Item subclass: Helmet [

    initialize: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'helmet'
            location: nil
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService helmetDescription.
    ]
]