Item subclass: Bandage [

    initialize: newLocation [
        super initializeWithName: 'bandage'
            location: newLocation.
    ]

    description [
        communicatesService bandageDescription.
    ]
]