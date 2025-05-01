Item subclass: Rag [
    | isChloroformed | 

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'rag' 
            location: newLocation
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        isChloroformed := false.
    ]

    isChloroformed [
        ^ isChloroformed
    ]

    isChloroformed: newIsChloroformed [
        isChloroformed := newIsChloroformed.
    ]

    description [
        communicatesService ragDescription.
    ]

    addChloroform [
        self name: ('chloroformed ', self name) asString.
        self isChloroformed: true.
    ]
]