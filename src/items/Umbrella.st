Item subclass: Umbrella [

    Umbrella class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'umbrella'
            location: newLocation.
    ]

    description [
        communicatesService umbrellaDescription.
    ]
]
