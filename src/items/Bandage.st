Item subclass: Bandage [

    Bandage class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'bandage'
            location: newLocation.
    ]

    description [
        communicatesService bandageDescription.
    ]
]