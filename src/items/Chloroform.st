Item subclass: Chloroform [

    initialize [
        super initializeWithName: 'chloroform'
            location: medicBay.
    ]

    description [
        communicatesService chloroformDescription.
    ]
]
