Item subclass: Letter [

    initialize [
        super initializeWithName: 'letter'
            location: goebbelsOffice.
    ]

    description [
        communicatesService letterDescription.
    ]
]