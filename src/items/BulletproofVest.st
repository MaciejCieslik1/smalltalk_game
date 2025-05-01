Item subclass: BulletproofVest [

    initialize: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'bulletproof_vest'
            location: nil
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService bulletproofVestDescription.
    ]
]
