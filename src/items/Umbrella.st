Item subclass: Umbrella [

    initialize [
        super initializeWithName: 'umbrella'
            location: cloakroom.
    ]

    description [
        communicatesService umbrellaDescription.
    ]
]
