Item subclass: Lever [
    | isPulled |

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'lever' 
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        isPulled := false
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
