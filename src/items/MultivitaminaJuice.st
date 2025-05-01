Juice subclass: MultivitaminaJuice [

    initialize: newLocation
        communicatesService: newCommunicatesService 
        inputService: newInputService 
    [
        super initializeWithName: 'multivitamina_juice'
            location: newLocation
            isPoisoned: false
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService multivitaminaJuiceDescription.
    ]
]