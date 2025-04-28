Item subclass: Umbrella [

    initialize: newLocation [
        super initializeWithName: 'umbrella'
            location: newLocation.
    ]

    description [
        communicatesService umbrellaDescription.
    ]
]
