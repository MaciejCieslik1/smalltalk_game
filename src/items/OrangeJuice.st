Juice subclass: OrangeJuice [

    initialize [
        super initializeWithName: 'orange_juice'
            location: cafeteria
            isPoisoned: false.
    ]

    description [
        communicatesService orangeJuiceDescription.
    ]
]