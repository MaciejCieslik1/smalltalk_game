Item subclass: Chloroform [

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService 
    [
        super initializeWithName: 'chloroform'
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService chloroformDescription.
    ]
]
