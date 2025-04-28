Item subclass: Baton [

    initialize: newLocation [
        super initializeWithName: 'baton'
            location: newLocation.
    ]

    description [
        communicatesService batonDescription.
    ]
]