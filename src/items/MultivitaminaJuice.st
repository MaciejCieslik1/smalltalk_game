Juice subclass: MultivitaminaJuice [

    initialize [
        super initializeWithName: 'multivitamina_juice'
            location: cafeteria
            isPoisoned: false.
    ]

    description [
        communicatesService multivitaminaJuiceDescription.
    ]
]