Juice subclass: AppleJuice [
    initialize: newLocation[
        super initializeWithName: 'apple_juice'
            location: newLocation
            isPoisoned: false.
    ]

    description [
        communicatesService appleJuiceDescription.
    ]
]