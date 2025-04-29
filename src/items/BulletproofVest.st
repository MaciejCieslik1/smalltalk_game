Item subclass: BulletproofVest [

    BulletproofVest class >> newInitialize: location [
        ^ super new initialize: location.
    ]

    initialize: newLocation [
        super initializeWithName: 'bulletproof_vest'
            location: newLocation.
    ]

    description [
        communicatesService bulletproofVestDescription.
    ]
]
