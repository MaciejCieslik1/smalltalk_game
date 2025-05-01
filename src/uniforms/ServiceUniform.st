Uniform subclass: ServiceUniform [

    initialize: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'service_uniform' 
            communicatesService: newCommunicatesService
            inputService: newInputService.
    ]

    description [
        communicatesService serviceUniformDescription
    ]
]
