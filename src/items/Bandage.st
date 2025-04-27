Item subclass: Bandage [

    initialize [
        super initializeWithName: 'bandage'
            location: medicBay.
    ]

    description [
        communicatesService bandageDescription.
    ]
]