Item subclass: Helmet [

    initialize [
        super initializeWithName: 'helmet'
            location: nil.
    ]

    description [
        communicatesService helmetDescription.
    ]
]