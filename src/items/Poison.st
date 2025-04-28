Item subclass: Poison [

    initialize: newLocation [
        super initializeWithName: 'poison'
            location: newLocation.
    ]

    description [
        communicatesService poisonDescription.
    ]
]