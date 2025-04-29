Item subclass: Chloroform [

    Chloroform class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'chloroform'
            location: newLocation.
    ]

    description [
        communicatesService chloroformDescription.
    ]
]
