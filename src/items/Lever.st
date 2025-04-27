Item subclass: Lever [
    | isPulled |

    initializeWithName: newName location: newLocation[
        super initializeWithName: 'lever' 
            location: archives.
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
