Juice subclass: AppleJuice [
    initialize [
        super initializeWithName: 'apple_juice'
            location: cafeteria
            isPoisoned: false.
    ]

    description [
        communicatesService appleJuiceDescription.
    ]
]