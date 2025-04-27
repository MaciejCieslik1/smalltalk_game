Item subclass: Gun [

    initialize [
        super initializeWithName: 'gun'
            location: nil
    ]

    description [
        communicatesService gunDescription
    ]
]
