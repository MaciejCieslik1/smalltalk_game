Item subclass: Gun [

    Gun class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize [
        super initializeWithName: 'gun'
            location: nil
    ]

    description [
        communicatesService gunDescription
    ]
]
