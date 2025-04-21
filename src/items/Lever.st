Item subclass: #Lever
    instanceVariableNames: 'isPulled'

Lever >> initialize: newName [
    super initialize: 'lever'
    isPulled := false
]

Lever >> isPulled [
    ^ isPulled
]

Lever >> isPulled: newIsPulled [
    isPulled := newIsPulled
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