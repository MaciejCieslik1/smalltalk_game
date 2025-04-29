Juice subclass: AppleJuice [

    AppleJuice class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'apple_juice'
            location: newLocation
            isPoisoned: false.
    ]

    description [
        communicatesService appleJuiceDescription.
    ]
]