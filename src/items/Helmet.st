Item subclass: Helmet [

    Helmet class >> newInitialize: location [
        ^ super new initialize: location.
    ]


    initialize [
        super initializeWithName: 'helmet'
            location: nil.
    ]

    description [
        communicatesService helmetDescription.
    ]
]