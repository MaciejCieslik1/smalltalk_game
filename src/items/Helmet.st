Item subclass: Helmet [

    Helmet class >> newInitialize [
        ^ super new initialize.
    ]


    initialize [
        super initializeWithName: 'helmet'
            location: nil.
    ]

    description [
        communicatesService helmetDescription.
    ]
]