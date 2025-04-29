Item subclass: Letter [

    Letter class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'letter'
            location: newLocation.
    ]

    description [
        communicatesService letterDescription.
    ]
]