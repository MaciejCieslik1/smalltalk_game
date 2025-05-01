Uniform subclass: MilitaryUniform [

    initialize: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'military_uniform' 
            communicatesService: newCommunicatesService
            inputService: newInputService.
    ]

    description [
        communicatesService militaryUniformDescription
    ]
]
