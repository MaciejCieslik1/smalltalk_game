Item subclass: Poison [

    initialize [
        super initializeWithName: 'poison'
            location: foodStorage.
    ]

    description [
        communicatesService poisonDescription.
    ]
]