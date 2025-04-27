Item subclass: BulletproofVest [

    initialize [
        super initializeWithName: 'bulletproof_vest'
            location: nil.
    ]

    description [
        communicatesService bulletproofVestDescription.
    ]
]
