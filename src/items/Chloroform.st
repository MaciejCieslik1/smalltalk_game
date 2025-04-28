Item subclass: Chloroform [

    initialize: newLocation [
        super initializeWithName: 'chloroform'
            location: newLocation.
    ]

    description [
        communicatesService chloroformDescription.
    ]
]
