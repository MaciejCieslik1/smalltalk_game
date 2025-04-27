Item subclass: Vitamins [

    initialize [
        super initializeWithName: 'vitamins'
            location: medicBay.
    ]

    description [
        communicatesService vitaminsDescription.
    ]
]