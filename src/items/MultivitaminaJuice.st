Juice subclass: MultivitaminaJuice [

    MultivitaminaJuice class >> newInitialize: location [
        ^ super new initialize: location.
    ]


    initialize: newLocation [
        super initializeWithName: 'multivitamina_juice'
            location: newLocation
            isPoisoned: false.
    ]

    description [
        communicatesService multivitaminaJuiceDescription.
    ]
]