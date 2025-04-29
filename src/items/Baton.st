Item subclass: Baton [

    Baton class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'baton'
            location: newLocation.
    ]

    description [
        communicatesService batonDescription.
    ]
]