Item subclass: BulletproofVest [

    BulletproofVest class >> newInitialize [
        ^ super new initialize.
    ]

    initialize: newLocation [
        super initializeWithName: 'bulletproof_vest'
            location: nil.
    ]

    description [
        communicatesService bulletproofVestDescription.
    ]
]
