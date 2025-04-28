Juice subclass: MultivitaminaJuice [

    initialize: newLocation [
        super initializeWithName: 'multivitamina_juice'
            location: newLocation
            isPoisoned: false.
    ]

    description [
        communicatesService multivitaminaJuiceDescription.
    ]
]