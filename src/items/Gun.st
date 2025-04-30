Item subclass: Gun [

    Gun class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'gun'
            location: nil
    ]

    description [
        communicatesService gunDescription
    ]
]
