Item subclass: BulletproofVest [

    initialize: newLocation [
        super initializeWithName: 'bulletproof_vest'
            location: newLocation.
    ]

    description [
        communicatesService bulletproofVestDescription.
    ]
]
