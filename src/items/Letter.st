Item subclass: Letter [

    initialize: newLocation [
        super initializeWithName: 'letter'
            location: newLocation.
    ]

    description [
        communicatesService letterDescription.
    ]
]