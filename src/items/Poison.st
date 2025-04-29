Item subclass: Poison [

    Poison class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'poison'
            location: newLocation.
    ]

    description [
        communicatesService poisonDescription.
    ]
]