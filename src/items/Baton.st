Item subclass: Baton [

    initialize [
        super initializeWithName: 'baton'
            location: barracks.
    ]

    description [
        communicatesService batonDescription.
    ]
]