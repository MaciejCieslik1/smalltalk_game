Item subclass: Vitamins [

    initialize: newLocation [
        super initializeWithName: 'vitamins'
            location: newLocation.
    ]

    description [
        communicatesService vitaminsDescription.
    ]
]