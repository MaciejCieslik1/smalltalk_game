Item subclass: #Lever
    instanceVariableNames: 'isPulled'

Lever >> initialize: newName newLocation[
    super initialize: 'lever' 
        location: archives
    isPulled := false
]

Lever >> isPulled [
    ^ isPulled
]

Lever >> isPulled: newIsPulled [
    isPulled := newIsPulled
]

Lever pickUp [
    communicatesService cannotPickUpItem
]

Lever >> interact [
    (self isPulled)
    ifTrue: [
        communicatesService leverAlreadyPulled
    ]
    ifFalse: [
        communicatesService leverPulled
        communicatesService leverRumbling
        self isPulled: true
    ]
]
