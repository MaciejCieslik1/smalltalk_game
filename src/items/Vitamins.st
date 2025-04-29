Item subclass: Vitamins [

    Vitamins class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'vitamins'
            location: newLocation.
    ]

    description [
        communicatesService vitaminsDescription.
    ]
]