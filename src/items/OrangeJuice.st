Juice subclass: OrangeJuice [

    initialize: newLocation [
        super initializeWithName: 'orange_juice'
            location: newLocation
            isPoisoned: false.
    ]

    description [
        communicatesService orangeJuiceDescription.
    ]
]