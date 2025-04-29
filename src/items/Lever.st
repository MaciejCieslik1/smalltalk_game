Item subclass: Lever [
    | isPulled |

    Lever class >> newInitialize: location [
        ^ super new initialize: location.
    ]


    initializeWithName: newName location: newLocation[
        super initializeWithName: 'lever' 
            location: newLocation.
        isPulled := false.
    ]

    isPulled [
        ^ isPulled
    ]

    isPulled: newIsPulled [
        isPulled := newIsPulled.
    ]

    pickUp [
        communicatesService cannotPickUpItem.
    ]

    interact [
        (self isPulled)
        ifTrue: [
            communicatesService leverAlreadyPulled.
        ]
        ifFalse: [
            communicatesService leverPulled.
            communicatesService leverRumbling.
            self isPulled: true.
        ]
    ]

    description [
        communicatesService leverDescription.
    ]
]
