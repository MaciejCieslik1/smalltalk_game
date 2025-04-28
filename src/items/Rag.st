Item subclass: Rag [
    | isChloroformed | 

    initialize: newLocation [
        super initializeWithName: 'rag' 
            location: newLocation
            isChloroformed: false.
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