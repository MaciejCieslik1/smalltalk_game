Juice subclass: OrangeJuice [

    OrangeJuice class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'orange_juice'
            location: newLocation
            isPoisoned: false.
    ]

    description [
        communicatesService orangeJuiceDescription.
    ]
]